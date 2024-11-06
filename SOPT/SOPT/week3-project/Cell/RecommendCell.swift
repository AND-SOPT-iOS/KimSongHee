//
//  RecommendCell.swift
//  SOPT
//
//  Created by 김송희 on 10/31/24.
//

import UIKit
import SnapKit
import Then

class RecommendCell: UICollectionViewCell {
    
    static let identifier = "RecommendCell"
    
    private let categoryLabel = UILabel().then {
        $0.textColor = .systemBlue
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
    }
    
    private let titleLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 22, weight: .regular)
    }
    
    private let subtitleLabel = UILabel().then {
        $0.textColor = .systemGray
        $0.font = .systemFont(ofSize: 20, weight: .regular)
    }
    
    private let recommendImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
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
        addSubviews(categoryLabel, titleLabel, subtitleLabel, recommendImageView)
    }
    
    private func setLayout() {
        categoryLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(15)
            $0.leading.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(categoryLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview()
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview()
        }
        
        recommendImageView.snp.makeConstraints {
            $0.top.equalTo(subtitleLabel.snp.bottom).offset(5)
            $0.height.equalTo(250)
            $0.width.equalTo(350)
            $0.leading.equalToSuperview()
        }
        
    }
    
    func bind(_ mockData: Recommend) {
        categoryLabel.text = mockData.category
        titleLabel.text = mockData.title
        subtitleLabel.text = mockData.subtitle
        recommendImageView.image = mockData.image
    }
    
}
