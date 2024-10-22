//
//  TitleView.swift
//  SOPT
//
//  Created by 김송희 on 10/18/24.
//

import UIKit

class TitleView: UIView {
    
    private let appIconImageView = UIImageView()
    private let appTitleLabel = UILabel()
    private let subTitleLabel = UILabel()
    private let openButton = UIButton(type: .system) //system으로 설정하면 기본 파란색 스타일
    private let shareButton = UIButton(type: .system)
    
    // UIView를 별도 파일로 분리하면 초기화 메소드 init을 적어줘야 함
    // 코드로 뷰를 생성할 때 호출
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setUI()
        setLayout()
    }
    
    // 스토리보드 또는 XIB로 뷰가 생성될 때 호출
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        // 앱 아이콘 설정
        appIconImageView.image = UIImage(named: "toss_icon") // asset에 파일이 있어야 함
        appIconImageView.contentMode = .scaleAspectFit // 비율 유지하면서 View에 딱 들어맞도록
        appIconImageView.layer.cornerRadius = 20
        appIconImageView.clipsToBounds = true // 뷰의 경계를 넘으면 잘라냄
        appIconImageView.layer.borderWidth = 0.5
        appIconImageView.layer.borderColor = UIColor.lightGray.cgColor
        
        // 앱 이름 라벨 설정
        appTitleLabel.text = "토스"
        appTitleLabel.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        
        // 개발자 이름 라벨 설정
        subTitleLabel.text = "금융이 쉬워진다"
        subTitleLabel.font = UIFont.systemFont(ofSize: 16)
        subTitleLabel.textColor = .systemGray
        
        // 업데이트 버튼 설정
        openButton.setTitle("열기", for: .normal)
        openButton.setTitleColor(.white, for: .normal)
        openButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        openButton.backgroundColor = .systemBlue
        openButton.layer.cornerRadius = 15
        openButton.clipsToBounds = true
        openButton.contentEdgeInsets = UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 20)
        
        // 공유 버튼 설정
        let shareIconConfig = UIImage.SymbolConfiguration(weight: .medium) // 아이콘 두께
        let shareIcon = UIImage(systemName: "square.and.arrow.up", withConfiguration: shareIconConfig)
        shareButton.setImage(shareIcon, for: .normal)
        shareButton.tintColor = .systemBlue
    }
    
    private func setUI() {
        addSubviews(appIconImageView, appTitleLabel, subTitleLabel, openButton, shareButton)
    }
    
    private func setLayout() {
        
        appIconImageView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview()
            $0.width.height.equalTo(130)
        }
        
        appTitleLabel.snp.makeConstraints {
            $0.leading.equalTo(appIconImageView.snp.trailing).offset(15)
            $0.top.equalTo(appIconImageView.snp.top)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.leading.equalTo(appTitleLabel)
            $0.top.equalTo(appTitleLabel.snp.bottom).offset(5)
        }
        
        openButton.snp.makeConstraints {
            $0.leading.equalTo(appTitleLabel)
            $0.bottom.equalTo(appIconImageView.snp.bottom)
        }
        
        shareButton.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.centerY.equalTo(openButton.snp.centerY)
            $0.width.height.equalTo(30)
        }
    }
}
