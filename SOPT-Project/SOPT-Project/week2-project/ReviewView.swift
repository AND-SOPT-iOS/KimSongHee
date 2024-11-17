//
//  ReviewView.swift
//  SOPT
//
//  Created by 김송희 on 10/23/24.
//

import UIKit

class ReviewView: UIView {
    
    final let cellHeight: CGFloat = 350
    final let contentInterSpacing: CGFloat = 8 // 셀 사이의 간격
    final let contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
    
    private let tapToReviewLabel = UILabel()
    private lazy var starButton = UIButton(type: .system)
    private lazy var writeReviewButton = UIButton(type: .system)
    private lazy var helpButton = UIButton(type: .system)
    
    private var ReviewList = Review.mockData
    
    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setCollectionView()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = .zero
        flowLayout.minimumInteritemSpacing = 0
        
        let cellWidth = UIScreen.main.bounds.width - 40
        flowLayout.itemSize = .init(width: cellWidth, height: cellHeight)
        
        collectionView.do {
            $0.setCollectionViewLayout(flowLayout, animated: false)
            $0.register(
                ReviewCell.self,
                forCellWithReuseIdentifier: ReviewCell.identifier
            )
            $0.delegate = self
            $0.dataSource = self
                    
            $0.showsHorizontalScrollIndicator = false
            $0.decelerationRate = UIScrollView.DecelerationRate.fast
        }
    }
    
    private func setStyle() {        
        tapToReviewLabel.text = "탭하여 평가하기:"
        tapToReviewLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        tapToReviewLabel.textColor = .lightGray
        
        starButton.setTitleColor(.systemBlue, for: .normal)
        var starConfig = UIButton.Configuration.plain()
        starConfig.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
        var starText = AttributedString("☆ ☆ ☆ ☆ ☆")
        starText.font = UIFont.systemFont(ofSize: 35, weight: .light)
        starText.foregroundColor = .systemBlue
        starConfig.attributedTitle = starText
        starButton.configuration = starConfig
        starButton.addTarget(self, action: #selector(starButtonTapped), for: .touchUpInside)
        
        writeReviewButton.setTitle("리뷰 작성", for: .normal)
        writeReviewButton.setTitleColor(.systemBlue, for: .normal)
        writeReviewButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        writeReviewButton.tintColor = .systemBlue
        var writeReviewConfig = UIButton.Configuration.plain()
        writeReviewConfig.image = UIImage(systemName: "square.and.pencil")
        writeReviewConfig.imagePadding = 5
        writeReviewConfig.imagePlacement = .leading
        writeReviewConfig.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        writeReviewButton.configuration = writeReviewConfig
        
        helpButton.setTitle("앱 지원", for: .normal)
        helpButton.setTitleColor(.systemBlue, for: .normal)
        helpButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        helpButton.tintColor = .systemBlue
        var helpConfig = UIButton.Configuration.plain()
        helpConfig.image = UIImage(systemName: "questionmark.circle")
        helpConfig.imagePadding = 5
        helpConfig.imagePlacement = .leading
        helpConfig.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        helpButton.configuration = helpConfig
        
    }
    
    private func setUI() {
        addSubviews(tapToReviewLabel, starButton, collectionView, writeReviewButton, helpButton)
    }
    
    private func setLayout() {
        tapToReviewLabel.snp.makeConstraints{
            $0.leading.equalToSuperview()
            //$0.top.equalToSuperview().offset(10)
            $0.centerY.equalTo(starButton.snp.centerY)
        }
        
        starButton.snp.makeConstraints{
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(starButton.snp.bottom)
            $0.height.equalTo(270)
            $0.width.equalToSuperview()
        }
        
        writeReviewButton.snp.makeConstraints{
            $0.top.equalTo(collectionView.snp.bottom).offset(30)
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        helpButton.snp.makeConstraints{
            $0.top.equalTo(collectionView.snp.bottom).offset(30)
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
    }
    
    @objc func starButtonTapped() {
        
    }
    
}

extension ReviewView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return ReviewList.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ReviewCell.identifier,
            for: indexPath
        ) as? ReviewCell else {
            return UICollectionViewCell()
        }
        
        cell.bind(ReviewList[indexPath.row])
        return cell
    }
}

extension ReviewView: UICollectionViewDelegateFlowLayout {
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
extension ReviewView: UIScrollViewDelegate {
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

