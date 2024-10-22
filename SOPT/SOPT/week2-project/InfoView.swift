//
//  InfoView.swift
//  SOPT
//
//  Created by 김송희 on 10/18/24.
//

import UIKit
import SnapKit

class InfoView: UIView {
    
    private let ratingCountLabel = UILabel()
    private let ratingValueLabel = UILabel()
    private let ratingStarLabel = UILabel()
    private let ratingStackView = UIStackView()
    
    private let firstVerticalDividerView = UIView()
    
    private let awardTitleLabel = UILabel()
    private let awardNameLabel = UILabel()
    private let awardCategoryLabel = UILabel()
    private let awardStackView = UIStackView()
    
    private let secondVerticalDividerView = UIView()
    
    private let ageTitleLabel = UILabel()
    private let ageValueLabel = UILabel()
    private let ageUnitLabel = UILabel()
    private let ageStackView = UIStackView()
    
    private let mainStackView = UIStackView()
    
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
        
        ratingCountLabel.text = "8.4만개의 평가"
        ratingCountLabel.textColor = .lightGray
        ratingCountLabel.textAlignment = .center
        ratingCountLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        
        ratingValueLabel.text = "4.4"
        ratingValueLabel.textColor = .gray
        ratingValueLabel.textAlignment = .center
        ratingValueLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        ratingStarLabel.text = "★★★★☆"
        ratingStarLabel.textColor = .gray
        ratingStarLabel.textAlignment = .center
        ratingStarLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        
        awardTitleLabel.text = "수상"
        awardTitleLabel.textColor = .lightGray
        awardTitleLabel.textAlignment = .center
        awardTitleLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        
        awardNameLabel.text = "에디터의\n선택"
        awardNameLabel.textColor = .lightGray
        awardNameLabel.textAlignment = .center
        awardNameLabel.numberOfLines = 0 //여러 줄 표시 허용
        awardNameLabel.font = UIFont.systemFont(ofSize: 8, weight: .bold)
        
        awardCategoryLabel.text = "앱"
        awardCategoryLabel.textColor = .lightGray
        awardCategoryLabel.textAlignment = .center
        awardCategoryLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        
        ageTitleLabel.text = "연령"
        ageTitleLabel.textColor = .lightGray
        ageTitleLabel.textAlignment = .center
        ageTitleLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        
        ageValueLabel.text = "4+"
        ageValueLabel.textColor = .gray
        ageValueLabel.textAlignment = .center
        ageValueLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        ageUnitLabel.text = "세"
        ageUnitLabel.textColor = .lightGray
        ageUnitLabel.textAlignment = .center
        ageUnitLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        
        // 왜 둘이 색깔이 달라 보일까
        firstVerticalDividerView.backgroundColor = .systemGray
        secondVerticalDividerView.backgroundColor = .systemGray
        
    }
    
    private func setUI() {
        ratingStackView.addArrangedSubview(ratingCountLabel)
        ratingStackView.addArrangedSubview(ratingValueLabel)
        ratingStackView.addArrangedSubview(ratingStarLabel)
        ratingStackView.axis = .vertical
        ratingStackView.spacing = 8
        
        awardStackView.addArrangedSubview(awardTitleLabel)
        awardStackView.addArrangedSubview(awardNameLabel)
        awardStackView.addArrangedSubview(awardCategoryLabel)
        awardStackView.axis = .vertical
        awardStackView.spacing = 8
        
        ageStackView.addArrangedSubview(ageTitleLabel)
        ageStackView.addArrangedSubview(ageValueLabel)
        ageStackView.addArrangedSubview(ageUnitLabel)
        ageStackView.axis = .vertical
        ageStackView.spacing = 4 //왜 얘만 간격 줄여줘야 전체 높이가 비슷해질까
        
        mainStackView.addArrangedSubview(ratingStackView)
        mainStackView.addArrangedSubview(firstVerticalDividerView)
        mainStackView.addArrangedSubview(awardStackView)
        mainStackView.addArrangedSubview(secondVerticalDividerView)
        mainStackView.addArrangedSubview(ageStackView)
        
        mainStackView.axis = .horizontal
        mainStackView.spacing = 30
        mainStackView.distribution = .equalCentering
        mainStackView.alignment = .leading
        
        addSubviews(mainStackView)
    }
    
    private func setLayout() {
        mainStackView.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        firstVerticalDividerView.snp.makeConstraints{
            $0.width.equalTo(0.5)
            $0.top.equalToSuperview().offset(10)
            $0.height.equalToSuperview().offset(-20)
        }
        
        secondVerticalDividerView.snp.makeConstraints{
            $0.width.equalTo(0.5)
            $0.top.equalToSuperview().offset(10)
            $0.height.equalToSuperview().offset(-20)
        }
    }
    
}
