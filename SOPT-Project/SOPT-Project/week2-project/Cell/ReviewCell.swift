//
//  ReviewCell.swift
//  SOPT
//
//  Created by 김송희 on 11/1/24.
//

import UIKit

class ReviewCell: UICollectionViewCell {
    
    static let identifier = "ReviewCell"
    
    private lazy var singleReviewButton = UIButton(type: .system)
    private let reviewTitleLabel = UILabel()
    private let reviewDateLabel = UILabel()
    private let starLabel = UILabel()
    private let nicknameLabel = UILabel()
    private let reviewContentLabel = UILabel()
    private let reviewMoreLabel = UILabel()
    
    private let answerTitleLabel = UILabel()
    private let answerDateLabel = UILabel()
    private let answerContentLabel = UILabel()
    private let answerMoreLabel = UILabel()
    
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
        singleReviewButton.backgroundColor = .systemGray6
        singleReviewButton.layer.cornerRadius = 10
        
        // reviewTitleLabel.text = "토스 UX 전버전으로 해주세요"
        reviewTitleLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        // reviewDateLabel.text = "9월 27일"
        reviewDateLabel.font = UIFont.systemFont(ofSize: 16)
        reviewDateLabel.textColor = .systemGray
        
        // starLabel.text = "★★★★★"
        starLabel.font = UIFont.systemFont(ofSize: 13)
        starLabel.textColor = .systemOrange
        
        // nicknameLabel.text = "흑 운영자님 ㅠㅠ"
        nicknameLabel.font = UIFont.systemFont(ofSize: 16)
        nicknameLabel.textColor = .systemGray
        
        let ReviewDescriptionContentStyle = NSMutableParagraphStyle()
        ReviewDescriptionContentStyle.lineSpacing = 3
        let ReviewDescriptionContentText = NSAttributedString(
            // string: "최근 업데이트가 토스 만의 ux 색깔 개성자체를 잃어버린 것 같습니다. 메인 화면 볼때마다 되게 부드럽고 한눈에 보기 편했는데, 이번 업데이트",
            string: "",
            attributes: [
                .paragraphStyle: ReviewDescriptionContentStyle,
                .font: UIFont.systemFont(ofSize: 17) // 폰트 설정
            ]
        )
        reviewContentLabel.attributedText = ReviewDescriptionContentText
        reviewContentLabel.font = UIFont.systemFont(ofSize: 16)
        reviewContentLabel.numberOfLines = 3
        reviewContentLabel.lineBreakMode = .byTruncatingTail
        
        reviewMoreLabel.text = "더 보기"
        reviewMoreLabel.font = UIFont.systemFont(ofSize: 16)
        reviewMoreLabel.textColor = .systemBlue
        
        answerTitleLabel.text = "개발자 답변"
        answerTitleLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        // answerDateLabel.text = "9월 29일"
        answerDateLabel.font = UIFont.systemFont(ofSize: 16)
        answerDateLabel.textColor = .systemGray
        
        
        let AnswerDescriptionContentStyle = NSMutableParagraphStyle()
        AnswerDescriptionContentStyle.lineSpacing = 3
        let AnswerDescriptionContentText = NSAttributedString(
            // string: "안녕하세요, 토스팀입니다. 소중한 의견을 주셔서 너무나 감사합니다. 토스 화면 UI를 사용자",
            string: "",
            attributes: [
                .paragraphStyle: AnswerDescriptionContentStyle,
                .font: UIFont.systemFont(ofSize: 17) // 폰트 설정
            ]
        )
        answerContentLabel.attributedText = AnswerDescriptionContentText
        answerContentLabel.font = UIFont.systemFont(ofSize: 16)
        answerContentLabel.numberOfLines = 2
        answerContentLabel.lineBreakMode = .byTruncatingTail
        
        answerMoreLabel.text = "더 보기"
        answerMoreLabel.font = UIFont.systemFont(ofSize: 16)
        answerMoreLabel.textColor = .systemBlue
    }
    
    private func setUI() {
        singleReviewButton.addSubviews(reviewTitleLabel, reviewDateLabel, starLabel, nicknameLabel, reviewContentLabel, reviewMoreLabel, answerTitleLabel, answerDateLabel, answerContentLabel, answerMoreLabel)
        addSubview(singleReviewButton)
    }
    
    private func setLayout() {
        singleReviewButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30)
            $0.width.equalToSuperview()
            $0.height.equalTo(250)
        }
        
        reviewTitleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(20)
        }
        
        reviewDateLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        starLabel.snp.makeConstraints{
            $0.top.equalTo(reviewTitleLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(20)
        }
        
        nicknameLabel.snp.makeConstraints{
            $0.top.equalTo(reviewDateLabel.snp.bottom).offset(5)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        reviewContentLabel.snp.makeConstraints{
            $0.top.equalTo(starLabel.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        reviewMoreLabel.snp.makeConstraints{
            $0.bottom.equalTo(reviewContentLabel.snp.bottom)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        answerTitleLabel.snp.makeConstraints{
            $0.top.equalTo(reviewContentLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
        }
        
        answerDateLabel.snp.makeConstraints{
            $0.top.equalTo(reviewContentLabel.snp.bottom).offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        answerContentLabel.snp.makeConstraints{
            $0.top.equalTo(answerTitleLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        answerMoreLabel.snp.makeConstraints{
            $0.bottom.equalTo(answerContentLabel.snp.bottom)
            $0.trailing.equalToSuperview().offset(-20)
        }
    }
    
    func bind(_ mockData: Review) {
        reviewTitleLabel.text = mockData.title
        reviewDateLabel.text = mockData.reviewDate
        starLabel.text = mockData.star
        nicknameLabel.text = mockData.nickname
        reviewContentLabel.text = mockData.reviewContent
        answerDateLabel.text = mockData.answerDate
        answerContentLabel.text = mockData.answerContent
    }
}
