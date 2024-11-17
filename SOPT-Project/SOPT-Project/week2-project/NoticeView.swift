//
//  NoticeView.swift
//  SOPT
//
//  Created by 김송희 on 10/23/24.
//

import UIKit

// 버전 기록 버튼이 눌리면 NavigationController 사용할 수 있도록
protocol NoticeViewDelegate: AnyObject {
    func transitionToNoticeViewController()
}

class NoticeView: UIView {
    
    weak var delegate: NoticeViewDelegate?
    
    private let noticeTitleLabel = UILabel()
    private let versionInfoLabel = UILabel()
    private lazy var versionRecordButton = UIButton()
    private let versionUpdateDateLabel = UILabel()
    private let noticeContentLabel = UILabel()
    
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
        noticeTitleLabel.text = "새로운 소식"
        noticeTitleLabel.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        
        versionInfoLabel.text = "버전 5.185.0"
        versionInfoLabel.font = UIFont.systemFont(ofSize: 15)
        versionInfoLabel.textColor = .systemGray
        
        versionRecordButton.setTitle("버전 기록", for: .normal)
        versionRecordButton.backgroundColor = .clear
        versionRecordButton.setTitleColor(.systemBlue, for: .normal)
        var config = UIButton.Configuration.plain()
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
        versionRecordButton.configuration = config
        versionRecordButton.addTarget(self, action: #selector(versionRecordButtonTapped), for: .touchUpInside)
        
        versionUpdateDateLabel.text = "5일 전"
        versionUpdateDateLabel.font = UIFont.systemFont(ofSize: 15)
        versionUpdateDateLabel.textColor = .systemGray
        
        let NoticeContentStyle = NSMutableParagraphStyle()
        NoticeContentStyle.lineSpacing = 5
        
        let NoticeContentText = NSAttributedString(
            string: "⋅ 구석구석 숨어있던 버그들을 잡았어요. 또 다른 버그가 나타나면 토스 고객센터를 찾아주세요. 늘 열려있답니다. 365일 24시간 언제든지요.",
            attributes: [
                .paragraphStyle: NoticeContentStyle,
                .font: UIFont.systemFont(ofSize: 17) // 폰트 설정
            ]
        )
        noticeContentLabel.attributedText = NoticeContentText
        noticeContentLabel.numberOfLines = 0
        noticeContentLabel.lineBreakMode = .byClipping
    }
    
    private func setUI() {
        addSubviews(noticeTitleLabel, versionInfoLabel, versionRecordButton, versionUpdateDateLabel, noticeContentLabel)
    }
    
    private func setLayout() {
        noticeTitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        versionInfoLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(noticeTitleLabel.snp.bottom).offset(5)
        }
        
        versionRecordButton.snp.makeConstraints{
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        versionUpdateDateLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.top.equalTo(versionInfoLabel.snp.top)
        }
        
        noticeContentLabel.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalTo(versionInfoLabel.snp.bottom).offset(15)
            $0.bottom.equalToSuperview()
        }
    }
    
    @objc func versionRecordButtonTapped() {
        delegate?.transitionToNoticeViewController()
    }
    
    
    
}
