//
//  DescriptionView.swift
//  SOPT
//
//  Created by 김송희 on 10/23/24.
//

import UIKit

class DescriptionView: UIView {
    
    private let descriptionContentLabel = UILabel()
    private let moreInfoButton = UIButton(type: .system)
    
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
        let DescriptionContentStyle = NSMutableParagraphStyle()
        DescriptionContentStyle.lineSpacing = 5
        
        let DescriptionContentText = NSAttributedString(
            string: "토스뱅크, 토스증권 서비스를 이용하시려면 토스 앱 설치가 필요합니다.\n● 내 금융 현황을 한눈에, 홈⋅소비\n⋅ 모든 계좌의 모든 정보를 한 곳에서, 따로 보았던 예적금, 청약, 증권, 대출 계좌의 정보를 한 곳에서 확인할 수 있어요.\n⋅ 얼마나 벌고 얼마나 썼을까? 한 달 동안의 수입과 소비를 시간순으로 모아볼 수 있고, 소비 분석 리포트도 제공해드려요.\n⋅ 카드 실적 헷갈릴 필요 없이, 실적을 충족한 카드가 무엇인지 얼마나 더 써야 실적을 달성하는지 한눈에 확인할 수 있어요.\n⋅ 매달 고정적으로 나가는 보험비, 생활요금, 구독료 등도 쉽게 확인할 수 있어요.",
            attributes: [
                .paragraphStyle: DescriptionContentStyle,
                .font: UIFont.systemFont(ofSize: 17) // 폰트 설정
            ]
        )
        descriptionContentLabel.attributedText = DescriptionContentText
        descriptionContentLabel.numberOfLines = 3 // 처음엔 3줄만 표시
        descriptionContentLabel.lineBreakMode = .byClipping
        
        moreInfoButton.setTitle("더 보기", for: .normal)
        moreInfoButton.setTitleColor(.systemBlue, for: .normal)
        moreInfoButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        moreInfoButton.addTarget(self, action: #selector(moreInfoButtonTapped), for: .touchUpInside)
    }
    
    private func setUI() {
        addSubviews(descriptionContentLabel, moreInfoButton)
    }
    
    private func setLayout() {
        descriptionContentLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        moreInfoButton.snp.makeConstraints {
            $0.bottom.equalTo(descriptionContentLabel.snp.bottom).offset(5)
            $0.trailing.equalToSuperview()
        }
    }
    
    @objc func moreInfoButtonTapped() {
    }
    
}
