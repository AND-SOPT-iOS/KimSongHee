//
//  ReviewView.swift
//  SOPT
//
//  Created by 김송희 on 10/23/24.
//

import UIKit

class ReviewView: UIView {
    
    private let tapToReviewLabel = UILabel()
    private lazy var starButton = UIButton(type: .system)
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
    
    private lazy var writeReviewButton = UIButton(type: .system)
    private lazy var helpButton = UIButton(type: .system)
    
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
        tapToReviewLabel.text = "탭하여 평가하기:"
        tapToReviewLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        tapToReviewLabel.textColor = .lightGray
        
        starButton.setTitleColor(.systemBlue, for: .normal)
        var starConfig = UIButton.Configuration.plain()
        starConfig.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
        var starText = AttributedString("☆ ☆ ☆ ☆ ☆")
        starText.font = UIFont.systemFont(ofSize: 35, weight: .light)
        starText.foregroundColor = .systemBlue
        starConfig.attributedTitle = starText
        starButton.configuration = starConfig
        starButton.addTarget(self, action: #selector(starButtonTapped), for: .touchUpInside)

        singleReviewButton.backgroundColor = .systemGray6
        singleReviewButton.layer.cornerRadius = 10
        
        // singleRevieButton에 들어갈 Labels
        reviewTitleLabel.text = "토스 UX 전버전으로 해주세요"
        reviewTitleLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        reviewDateLabel.text = "9월 27일"
        reviewDateLabel.font = UIFont.systemFont(ofSize: 16)
        reviewDateLabel.textColor = .systemGray
        
        starLabel.text = "★★★★★"
        starLabel.font = UIFont.systemFont(ofSize: 13)
        starLabel.textColor = .systemOrange
        
        nicknameLabel.text = "흑 운영자님 ㅠㅠ"
        nicknameLabel.font = UIFont.systemFont(ofSize: 16)
        nicknameLabel.textColor = .systemGray
        
        let ReviewDescriptionContentStyle = NSMutableParagraphStyle()
        ReviewDescriptionContentStyle.lineSpacing = 3
        let ReviewDescriptionContentText = NSAttributedString(
            string: "최근 업데이트가 토스 만의 ux 색깔 개성자체를 잃어버린 것 같습니다. 메인 화면 볼때마다 되게 부드럽고 한눈에 보기 편했는데, 이번 업데이트",
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
        
        answerDateLabel.text = "9월 29일"
        answerDateLabel.font = UIFont.systemFont(ofSize: 16)
        answerDateLabel.textColor = .systemGray
        
        
        let AnswerDescriptionContentStyle = NSMutableParagraphStyle()
        AnswerDescriptionContentStyle.lineSpacing = 3
        let AnswerDescriptionContentText = NSAttributedString(
            string: "안녕하세요, 토스팀입니다. 소중한 의견을 주셔서 너무나 감사합니다. 토스 화면 UI를 사용자",
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
        
        writeReviewButton.setTitle("리뷰 작성", for: .normal)
        writeReviewButton.setTitleColor(.systemBlue, for: .normal)
        writeReviewButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        writeReviewButton.tintColor = .systemBlue
        var writeReviewConfig = UIButton.Configuration.plain()
        writeReviewConfig.image = UIImage(systemName: "square.and.pencil")
        writeReviewConfig.imagePadding = 5
        writeReviewConfig.imagePlacement = .leading
        writeReviewConfig.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        writeReviewButton.configuration = writeReviewConfig
        
        helpButton.setTitle("앱 지원", for: .normal)
        helpButton.setTitleColor(.systemBlue, for: .normal)
        helpButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        helpButton.tintColor = .systemBlue
        var helpConfig = UIButton.Configuration.plain()
        helpConfig.image = UIImage(systemName: "questionmark.circle")
        helpConfig.imagePadding = 5
        helpConfig.imagePlacement = .leading
        helpConfig.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        helpButton.configuration = helpConfig
        
    }
    
    private func setUI() {
        singleReviewButton.addSubviews(reviewTitleLabel, reviewDateLabel, starLabel, nicknameLabel, reviewContentLabel, reviewMoreLabel, answerTitleLabel, answerDateLabel, answerContentLabel, answerMoreLabel)
        
        addSubviews(tapToReviewLabel, starButton, singleReviewButton, writeReviewButton, helpButton)
    }
    
    private func setLayout() {
        tapToReviewLabel.snp.makeConstraints{
            $0.leading.equalToSuperview()
            //$0.top.equalToSuperview().offset(10)
            $0.centerY.equalTo(starButton.snp.centerY)
        }
        
        starButton.snp.makeConstraints{
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        singleReviewButton.snp.makeConstraints {
            $0.top.equalTo(tapToReviewLabel.snp.bottom).offset(30)
            $0.width.equalToSuperview()
            $0.height.equalTo(250)
        }
        
        writeReviewButton.snp.makeConstraints{
            $0.top.equalTo(singleReviewButton.snp.bottom).offset(30)
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        helpButton.snp.makeConstraints{
            $0.top.equalTo(singleReviewButton.snp.bottom).offset(30)
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        
        //SingleReviewButton 내부 구성
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
    
    @objc func starButtonTapped() {
        
    }
    
}
