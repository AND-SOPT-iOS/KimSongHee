//
//  RecommendViewController.swift
//  SOPT
//
//  Created by 김송희 on 10/31/24.
//

import UIKit

class RecommendViewController: UIViewController {
    
    final let cellHeight: CGFloat = 350
    final let contentInterSpacing: CGFloat = 8 // 셀 사이의 간격
    final let contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20) // 좌우 여백
    
    private var recommendList = Recommend.mockData
    
    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setCollectionView()
    }
    
    private func setUI() {
        self.view.addSubview(collectionView)
    }
    
    private func setLayout() {
        collectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(cellHeight)
            $0.width.equalTo(200)
        }
    }
    
    private func setCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = .zero
        flowLayout.minimumInteritemSpacing = contentInterSpacing
        
        let itemSize = UIScreen.main.bounds.width - 40
        flowLayout.itemSize = .init(width: itemSize, height: cellHeight)
        
        collectionView.do {
            $0.setCollectionViewLayout(flowLayout, animated: false)
            $0.register(
                RecommendCell.self,
                forCellWithReuseIdentifier: RecommendCell.identifier
            )
            $0.delegate = self
            $0.dataSource = self
            
            // Paging이 안 됩니다...
            $0.isPagingEnabled = true
        }
    }
    
}

extension RecommendViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return recommendList.count
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
        
        cell.bind(recommendList[indexPath.row])
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

