//
//  RecommendViewController.swift
//  SOPT
//
//  Created by 김송희 on 10/31/24.
//

import UIKit
import SwiftUI
import Combine

class RecommendViewController: UIViewController {
    
    final let cellHeight: CGFloat = 350
    final let contentInterSpacing: CGFloat = 8 // 셀 사이의 간격
    final let contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20) // 좌우 여백
    
    private var viewModel = RecommendViewModel()
    // 구독을 저장하는 컨테이너로, 뷰컨이 메모리에서 해제되면 구독도 해제
    private var cancellables = Set<AnyCancellable>()
    
    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setCollectionView()
        
        // viewModel.$recommends를 구독하여 데이터 관찰
        // receive: 데이터 변경에 대한 알림을 메인 스레드에서 수신
        // sink: publisher에서 내보내는 값을 구독하고 처리
        // store: 구독을 명시적으로 관리
        viewModel.$recommends
            .receive(on: RunLoop.main)
            .sink { [weak self] _ in
                self?.collectionView.reloadData()
            }
            .store(in: &cancellables)
    }
    
    private func setUI() {
        self.view.addSubview(collectionView)
    }
    
    private func setLayout() {
        collectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(cellHeight)
            $0.width.equalToSuperview()
        }
    }
    
    private func setCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = .zero
        flowLayout.minimumInteritemSpacing = contentInterSpacing
        
        let cellWidth = UIScreen.main.bounds.width - 40
        flowLayout.itemSize = .init(width: cellWidth, height: cellHeight)
        
        collectionView.do {
            $0.setCollectionViewLayout(flowLayout, animated: false)
            $0.register(
                RecommendCell.self,
                forCellWithReuseIdentifier: RecommendCell.identifier
            )
            $0.delegate = self
            $0.dataSource = self
            
            $0.showsHorizontalScrollIndicator = false
            $0.decelerationRate = UIScrollView.DecelerationRate.fast
        }
    }
}

extension RecommendViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return viewModel.recommends.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RecommendCell.identifier,
            for: indexPath
        ) as? RecommendCell else {
            return UICollectionViewCell()
        }
        
        cell.bind(viewModel.recommends[indexPath.row])
        return cell
    }
}

extension RecommendViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 40, height: cellHeight)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        return contentInterSpacing
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        return contentInset
    }
}

// 자연스러운 paging을 위하여
extension RecommendViewController: UIScrollViewDelegate {
    func scrollViewWillEndDragging(
        _ scrollView: UIScrollView,
        withVelocity velocity: CGPoint,
        targetContentOffset: UnsafeMutablePointer<CGPoint>
    ) {
        guard let layout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        
        // 셀의 너비와 간격을 포함한 전체 크기 계산
        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
        
        // targetContentOffset.x를 기준으로 현재 인덱스 계산
        let targetIndex = round((targetContentOffset.pointee.x + scrollView.contentInset.left) / cellWidthIncludingSpacing)
        
        // targetContentOffset을 새로운 위치로 설정
        let xOffset = targetIndex * cellWidthIncludingSpacing - scrollView.contentInset.left
        targetContentOffset.pointee = CGPoint(x: xOffset, y: targetContentOffset.pointee.y)
    }
}
