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
    private let ageLimitLabel = UILabel()
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
        if let roundedFontDescriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .largeTitle)
            .withDesign(.rounded) {// rounded 디자인 적용
            let roundedFont = UIFont(descriptor: roundedFontDescriptor, size: 24)
            ratingValueLabel.font = UIFont(descriptor:  roundedFont.fontDescriptor.withSymbolicTraits(.traitBold)!, size: 24)
        } else {
            ratingValueLabel.font = UIFont.systemFont(ofSize: 24, weight: .heavy) // 폰트 설정 실패 시 기본 폰트
        }
        ratingValueLabel.textColor = .gray
        ratingValueLabel.textAlignment = .center
        
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
        
        ageLimitLabel.text = "4+"
        if let roundedFontDescriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .largeTitle)
            .withDesign(.rounded) {// rounded 디자인 적용
            let roundedFont = UIFont(descriptor: roundedFontDescriptor, size: 24)
            ageLimitLabel.font = UIFont(descriptor:  roundedFont.fontDescriptor.withSymbolicTraits(.traitBold)!, size: 24)
        } else {
            ageLimitLabel.font = UIFont.systemFont(ofSize: 24, weight: .heavy) // 폰트 설정 실패 시 기본 폰트
        }
        ageLimitLabel.textColor = .gray
        ageLimitLabel.textAlignment = .center
        
        ageUnitLabel.text = "세"
        ageUnitLabel.textColor = .lightGray
        ageUnitLabel.textAlignment = .center
        ageUnitLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        
        firstVerticalDividerView.backgroundColor = .systemGray4
        secondVerticalDividerView.backgroundColor = .systemGray4
        
    }
    
    private func setUI() {
        ratingStackView.addArrangedSubviews(ratingCountLabel, ratingValueLabel, ratingStarLabel)
        ratingStackView.axis = .vertical
        ratingStackView.spacing = 8
        
        awardStackView.addArrangedSubviews(awardTitleLabel, awardNameLabel, awardCategoryLabel)
        awardStackView.axis = .vertical
        awardStackView.spacing = 8
        
        ageStackView.addArrangedSubviews(ageTitleLabel, ageLimitLabel, ageUnitLabel)
        ageStackView.axis = .vertical
        ageStackView.spacing = 4 //왜 얘만 간격 줄여줘야 전체 높이가 비슷해질까
        
        mainStackView.addArrangedSubviews(ratingStackView, firstVerticalDividerView, awardStackView, secondVerticalDividerView)
        mainStackView.addArrangedSubview(ageStackView)
        
        mainStackView.axis = .horizontal
        mainStackView.distribution = .equalSpacing
        mainStackView.alignment = .center
        
        addSubviews(mainStackView)
    }
    
    private func setLayout() {
        mainStackView.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.bottom.equalToSuperview()
        }
        
        firstVerticalDividerView.snp.makeConstraints{
            $0.width.equalTo(0.5)
            $0.height.equalToSuperview().offset(-40)
            $0.centerY.equalToSuperview()
        }
        
        secondVerticalDividerView.snp.makeConstraints{
            $0.width.equalTo(0.5)
            $0.centerY.equalToSuperview()
            $0.height.equalToSuperview().offset(-40)
        }
    }
    
}
