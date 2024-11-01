//
//  FreeAppViewController.swift
//  SOPT
//
//  Created by 김송희 on 11/1/24.
//

import UIKit

protocol FreeAppViewControllerDelegate: AnyObject {
    func didSelectToss()
}

class FreeAppViewController: UIViewController {
    
    weak var delegate: FreeAppViewControllerDelegate?
    
    final let cellHeight: CGFloat = 70
    final let contentInterSpacing: CGFloat = 8 // 셀 사이의 간격
    final let contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20) // 좌우 여백
    
    private var freeAppList = FreeApp.mockData
    private let freeAppHeaderView = RankAppHeaderView()
    
    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    
    // 그룹으로 나눈 데이터 배열 생성
    private var groupedData: [[FreeApp]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groupData() // 데이터를 그룹으로 나누기
        setUI()
        setLayout()
        setCollectionView()
    }
    
    // paidAppList를 3개씩 묶어 groupedData 배열에 추가
    private func groupData() {
        let groupSize = 3
        for index in stride(from: 0, to: freeAppList.count, by: groupSize) {
            let group = Array(freeAppList[index..<min(index + groupSize, freeAppList.count)])
            groupedData.append(group)
        }
    }
    
    private func setUI() {
        self.view.addSubviews(freeAppHeaderView, collectionView)
    }
    
    private func setLayout() {
        freeAppHeaderView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(60)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(freeAppHeaderView.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(250)
        }
    }
    
    private func setCollectionView() {
        
        freeAppHeaderView.bind(title: "무료 순위")
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = .zero
        flowLayout.minimumLineSpacing = contentInterSpacing
        
        // 그룹당 3개의 셀이 보이도록 셀 너비 조정
        let cellWidth = UIScreen.main.bounds.width - 40
        flowLayout.itemSize = .init(width: cellWidth, height: cellHeight)
        
        collectionView.do {
            $0.setCollectionViewLayout(flowLayout, animated: false)
            $0.register(
                RankAppCell.self,
                forCellWithReuseIdentifier: RankAppCell.identifier
            )
            $0.delegate = self
            $0.dataSource = self
            
            $0.isPagingEnabled = true
            $0.showsHorizontalScrollIndicator = false
        }
    }
    
}

extension FreeAppViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        if indexPath.section == 0 && indexPath.item == 0 {
            delegate?.didSelectToss()
            // let tossViewController = TossViewController()
            // navigationController?.pushViewController(tossViewController, animated: true)
        }
    }
}

extension FreeAppViewController: UICollectionViewDataSource {
    
    // 그룹의 수만큼 섹션 설정
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return groupedData.count
    }
    
    // 각 섹션은 3개의 셀을 가지도록 설정
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return groupedData[section].count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RankAppCell.identifier,
            for: indexPath
        ) as? RankAppCell else {
            return UICollectionViewCell()
        }
        
        let item = groupedData[indexPath.section][indexPath.item]
        cell.freeAppBind(item)
        return cell
    }
}

extension FreeAppViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let cellWidth = (UIScreen.main.bounds.width - 40)
        return CGSize(width: cellWidth, height: cellHeight)
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

