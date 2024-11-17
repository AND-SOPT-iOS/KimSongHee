//
//  PreviewView.swift
//  SOPT
//
//  Created by 김송희 on 10/23/24.
//

import UIKit

class PreviewView: UIView {

    private let previewTitleLabel = UILabel()
    private let iPhoneLabel = UILabel()
    
    private var PreviewImageList = PreviewImage.mockData
    
    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setUI()
        setCollectionView()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        previewTitleLabel.text = "미리 보기"
        previewTitleLabel.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        
        let iPhoneIcon = UIImage(systemName: "iphone")?.withTintColor(.systemGray, renderingMode: .alwaysOriginal)
        let iPhoneIconAttachment = NSTextAttachment()
        iPhoneIconAttachment.image = iPhoneIcon
        
        let iPhoneIconText = NSMutableAttributedString(attachment: iPhoneIconAttachment)
        let iPhoneText = NSAttributedString(string: " iPhone", attributes: [
            .font: UIFont.systemFont(ofSize: 15, weight: .semibold),
            .foregroundColor: UIColor.systemGray
        ])
        
        iPhoneIconText.append(iPhoneText)
        iPhoneLabel.attributedText = iPhoneIconText
    }
    
    private func setUI() {
        addSubviews(previewTitleLabel, collectionView, iPhoneLabel)
    }
    
    private func setCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = .zero
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.itemSize = .init(width: 245, height: 520)
        
        collectionView.do {
            $0.setCollectionViewLayout(flowLayout, animated: false)
            $0.register(
                PreviewImageCell.self,
                forCellWithReuseIdentifier: PreviewImageCell.identifier
            )
            $0.delegate = self
            $0.dataSource = self
                        
            $0.showsHorizontalScrollIndicator = false
            $0.decelerationRate = UIScrollView.DecelerationRate.fast
        }
    }
    
    private func setLayout() {
        
        previewTitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(previewTitleLabel.snp.bottom).offset(10)
            $0.height.equalTo(520)
            $0.width.equalToSuperview()
        }
        
        iPhoneLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(collectionView.snp.bottom).offset(10)
            $0.bottom.equalToSuperview()
        }
    }
}

extension PreviewView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return PreviewImageList.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: PreviewImageCell.identifier,
            for: indexPath
        ) as? PreviewImageCell else {
            return UICollectionViewCell()
        }
        
        cell.bind(PreviewImageList[indexPath.row])
        return cell
    }
}

extension PreviewView: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: 245, height: 520)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        return 20
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

// 자연스러운 paging을 위하여
extension PreviewView: UIScrollViewDelegate {
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

