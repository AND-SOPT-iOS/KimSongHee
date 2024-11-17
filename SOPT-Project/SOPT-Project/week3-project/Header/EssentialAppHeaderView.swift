//
//  EssentialAppHeaderView.swift
//  SOPT
//
//  Created by 김송희 on 11/1/24.
//

import UIKit

class EssentialAppHeaderView: UIView {
        
    private let titleLabel = UILabel().then {
        $0.text = "필수 금융 앱"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 24, weight: .bold)
    }
    
    private let subtitleLabel = UILabel().then {
        $0.text = "App Store 에디터가 직접 골랐습니다"
        $0.textColor = .systemGray
        $0.font = .systemFont(ofSize: 16, weight: .regular)
    }
    
    private let chartViewLabel = UILabel().then {
        $0.text = "모두 보기"
        $0.textColor = .systemBlue
        $0.font = .systemFont(ofSize: 18, weight: .regular)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        self.addSubviews(titleLabel, subtitleLabel, chartViewLabel)
    }
    
    private func setLayout() {
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(20)
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(20)
        }
        
        chartViewLabel.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel.snp.centerY)
            $0.trailing.equalToSuperview().offset(-20)
        }
    }
    
    func bind(title: String, subtitle: String) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
    }
}
