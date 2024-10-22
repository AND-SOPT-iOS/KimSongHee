//
//  DeveloperView.swift
//  SOPT
//
//  Created by 김송희 on 10/23/24.
//

import UIKit

class DeveloperView: UIView {
    
    private let developerButton = UIButton(type: .system)
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let arrowImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        titleLabel.text = "Viva Republica"
        titleLabel.font = UIFont.systemFont(ofSize: 17)
        titleLabel.textColor = .systemBlue
        
        subtitleLabel.text = "개발자"
        subtitleLabel.font = UIFont.systemFont(ofSize: 15)
        subtitleLabel.textColor = .systemGray
        
        let arrowImage = UIImage(systemName: "chevron.right")
        arrowImageView.image = arrowImage
        arrowImageView.tintColor = .systemGray
        
        developerButton.backgroundColor = .clear
        developerButton.addTarget(self, action: #selector(developerButtonTapped), for: .touchUpInside)
    }
    
    private func setUI() {
        developerButton.addSubview(titleLabel)
        developerButton.addSubview(subtitleLabel)
        developerButton.addSubview(arrowImageView)
        
        addSubviews(developerButton) // 버튼을 View에 추가
    }
    
    private func setLayout() {
        developerButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
        }
        
        arrowImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-10)
            $0.centerY.equalToSuperview()
        }
    }
    
    @objc private func developerButtonTapped() {
        
    }
    
}
