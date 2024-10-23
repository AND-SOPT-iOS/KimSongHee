//
//  ReviewStatView.swift
//  SOPT
//
//  Created by 김송희 on 10/23/24.
//

import UIKit

protocol ReviewViewDelegate: AnyObject {
    func transitionToReviewViewController()
}

class StatView: UIView {
    
    weak var delegate: ReviewViewDelegate?
    
    private let titleLabel = UILabel()
    private let allInfoButton = UIButton(type: .system)
    private let scoreAvgLabel = UILabel()
    private let scoreScaleLabel = UILabel()
    private let statView = UIImageView()
    private let totalReviewLabel = UILabel()
    
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
        titleLabel.text = "평가 및 리뷰"
        titleLabel.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        
        allInfoButton.setTitle("모두 보기", for: .normal)
        allInfoButton.setTitleColor(.systemBlue, for: .normal)
        allInfoButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        allInfoButton.addTarget(self, action: #selector(allInfoButtonTapped), for: .touchUpInside)
        
        scoreAvgLabel.text = "4.4"
        if let roundedFontDescriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .largeTitle)
            .withDesign(.rounded) {// rounded 디자인 적용
            let roundedFont = UIFont(descriptor: roundedFontDescriptor, size: 54)
            scoreAvgLabel.font = UIFont(descriptor:  roundedFont.fontDescriptor.withSymbolicTraits(.traitBold)!, size: 54)
        } else {
            scoreAvgLabel.font = UIFont.systemFont(ofSize: 54, weight: .heavy) // 폰트 설정 실패 시 기본 폰트
        }
        
        scoreScaleLabel.text = "5점 만점"
        scoreScaleLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        scoreScaleLabel.textAlignment = .center
        scoreScaleLabel.textColor = .gray
        
        statView.image = UIImage(named: "review_stat") // asset에 파일이 있어야 함
        statView.contentMode = .scaleAspectFit // 비율 유지하면서 View에 딱 들어맞도록
        statView.clipsToBounds = true // 뷰의 경계를 넘으면 잘라냄
        statView.layer.borderWidth = 0.5
        statView.layer.borderColor = UIColor.clear.cgColor
        
        totalReviewLabel.text = "8.4만개의 평가"
        totalReviewLabel.font = UIFont.systemFont(ofSize: 15)
        totalReviewLabel.textAlignment = .center
        totalReviewLabel.textColor = .systemGray
    }
    
    private func setUI() {
        addSubviews(titleLabel, allInfoButton, scoreAvgLabel, scoreScaleLabel, statView, totalReviewLabel)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        allInfoButton.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        scoreAvgLabel.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
        }
        
        scoreScaleLabel.snp.makeConstraints{
            $0.centerX.equalTo(scoreAvgLabel.snp.centerX)
            $0.top.equalTo(scoreAvgLabel.snp.bottom).offset(3)
        }
        
        statView.snp.makeConstraints{
            $0.trailing.equalToSuperview()
            $0.top.equalTo(allInfoButton.snp.bottom).offset(5)
            $0.width.equalTo(240)
            $0.height.equalTo(60)
        }
        
        totalReviewLabel.snp.makeConstraints{
            $0.trailing.equalToSuperview()
            $0.centerY.equalTo(scoreScaleLabel.snp.centerY)
        }
    }
    
    @objc func allInfoButtonTapped() {
        delegate?.transitionToReviewViewController()
    }
    
}
