//
//  PhotoCell.swift
//  SOPT
//
//  Created by 김송희 on 10/30/24.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    // 초기값 없는 옵셔널 클로저 미리 정의
    var likeButtonAction: (() -> ())?
    
    // isLiked의 초기값은 false
    // didSet은 property observer로 isLiked의 상태가 변경될 대마다 UI 업데이트
    var isLiked = false {
        didSet {
            updateUI()
        }
    }
    
    // 식별자 정의
    static let identifier = "PhotoCell"
    
    // 컴포넌트 생성
    private lazy var photoImageView = UIImageView()
    private lazy var likeButton = UIButton()
    
    // 생성자 생성
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 컴포넌트 배치
    private func setUI() {
        likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        addSubviews(photoImageView, likeButton)
    }
    
    private func setLayout() {
        photoImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        likeButton.snp.makeConstraints {
            $0.trailing.bottom.equalToSuperview().inset(8)
            $0.size.equalTo(20)
        }
    }
        
    // Photo 객체를 받아와서 이미지를 저장하고 좋아요 설정
    // 데이터 변동 시 업데이트
    func bind(_ photo: Photo) {
        photoImageView.image = photo.image
        isLiked = photo.isLiked
    }
    
    @objc
    func likeButtonTapped() {
        likeButtonAction?() // ViewController에 알리기
    }
    
    // property observer에 의해 데이터 변경 시 호출됨
    private func updateUI() {
        let image = isLiked ? "heart.fill" : "heart"
        likeButton.setImage(UIImage(systemName: image), for: .normal)
    }
    
}
