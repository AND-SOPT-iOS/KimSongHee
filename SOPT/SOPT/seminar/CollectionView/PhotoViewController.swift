//
//  PhotoViewController.swift
//  SOPT
//
//  Created by 김송희 on 10/30/24.
//

import UIKit

enum PhotoSection: CaseIterable {
    case main
}

class PhotoViewController: UIViewController {
    
    private var photoList = Photo.mockData
    private var dataSource: UICollectionViewDiffableDataSource<PhotoSection, Photo>!
    
    private lazy var collectionView = UICollectionView(
        // 초기 크기는 0으로 설정 후 추후 오토 레이아웃
        frame: .zero,
        // 그리드 스타일의 레이아웃으로 지정
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        setCollectionView()
        configureDataSource()
        applySnapshot()
    }
    
    private func setUI() {
        view.addSubview(collectionView)
    }
    
    private func setLayout() {
        collectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.horizontalEdges.equalToSuperview()
        }
    }
    
    private func setCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        // 셀 사이의 간격 6 빼고, 한 줄에 3개 셀 들어가도록
        let itemSize = (UIScreen.main.bounds.width - 6) / 3
        flowLayout.itemSize = .init(width: itemSize, height: itemSize)
        flowLayout.minimumLineSpacing = 3 // 행 간 간격
        flowLayout.minimumInteritemSpacing = 3 // 아이템 간 간격
        
        // Then 라이브러리 도입
        collectionView.do {
            $0.setCollectionViewLayout(flowLayout, animated: false)
            // 셀 등록
            $0.register(
                PhotoCell.self,
                forCellWithReuseIdentifier: PhotoCell.identifier
            )
            $0.delegate = self
            $0.dataSource = self
        }
    }
    
    // Diffable DataSource
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<PhotoSection, Photo>(collectionView: collectionView) { collectionView, indexPath, photo in
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: PhotoCell.identifier,
                for: indexPath
            ) as? PhotoCell else {
                return UICollectionViewCell()
            }
            cell.bind(photo)
            cell.likeButtonAction = { [weak self] in
                guard let self = self else { return }
                if let index = self.photoList.firstIndex(where: { $0 == photo }) {
                    self.photoList[index].isLiked.toggle()
                }
                self.applySnapshot()
            }
            
            return cell
        }
    }
    
    // DataSource의 Snapshot 만들기
    private func applySnapshot() {
        // 좋아요 누를 때마다 눌린 아이템을 맨 앞으로 정렬
        let sortedPhotoList = self.photoList.sorted { $0.isLiked && !$1.isLiked }
        // Snapshot 생성
        var snapshot = NSDiffableDataSourceSnapshot<PhotoSection, Photo>()
        // main section에 추가
        snapshot.appendSections([.main])
        // 해당 섹션에 데이터 넣어주기
        snapshot.appendItems(sortedPhotoList, toSection: .main)
        // 간단하게 변경된 부분을 반영하는 apply()
        self.dataSource.apply(snapshot, animatingDifferences: true) // 5
    }
}

extension PhotoViewController: UICollectionViewDelegate { }
extension PhotoViewController: UICollectionViewDataSource {
    
    // 전체 셀 개수를 photoList의 아이템 개수만큼 설정
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return photoList.count
    }
    
    // 재사용 큐에서 사용할 셀 dequeue해서 반환
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(
            withReuseIdentifier: PhotoCell.identifier,
            for: indexPath
        ) as? PhotoCell else {
            return UICollectionViewCell()
        }
        
        // photoList 배열에서 indexPath.row에 위치한 데이터를 가져와서 PhotoCell에 전달
        item.bind(photoList[indexPath.row])
        
        // 좋아요 버튼 기능 구현
        item.likeButtonAction = { [weak self] in // 강한 순환 참조 방지
            // self가 nil이면 클로저 종료
            guard let self else { return }
            
            // self가 존재하면
            self.photoList[indexPath.row].isLiked.toggle() // 값 반대로
            self.collectionView.reloadItems(at: [indexPath]) // 변경된 셀만 새로고침
        }
        return item
    }
}

