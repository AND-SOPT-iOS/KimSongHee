//
//  PreviewView.swift
//  SOPT
//
//  Created by 김송희 on 10/23/24.
//

import UIKit

class PreviewView: UIView {

    private let previewTitleLabel = UILabel()
    private let previewImageView = UIImageView()
    private let iphoneLabel = UILabel()
    
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
        previewTitleLabel.text = "미리 보기"
        previewTitleLabel.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        
        previewImageView.image = UIImage(named: "preview_sample") // asset에 파일이 있어야 함
        previewImageView.contentMode = .scaleAspectFit // 비율 유지하면서 View에 딱 들어맞도록
        previewImageView.layer.cornerRadius = 25
        previewImageView.clipsToBounds = true // 뷰의 경계를 넘으면 잘라냄
        previewImageView.layer.borderWidth = 0.5
        previewImageView.layer.borderColor = UIColor.clear.cgColor
        
        let iphoneIcon = UIImage(systemName: "iphone")?.withTintColor(.systemGray, renderingMode: .alwaysOriginal)
        let iphoneIconAttachment = NSTextAttachment()
        iphoneIconAttachment.image = iphoneIcon
        
        let iphoneIconText = NSMutableAttributedString(attachment: iphoneIconAttachment)
        let iphoneText = NSAttributedString(string: " iPhone", attributes: [
            .font: UIFont.systemFont(ofSize: 15, weight: .semibold),
            .foregroundColor: UIColor.systemGray
        ])
        
        iphoneIconText.append(iphoneText)
        iphoneLabel.attributedText = iphoneIconText
    }
    
    private func setUI() {
        addSubviews(previewTitleLabel, previewImageView, iphoneLabel)
    }
    
    private func setLayout() {
        previewTitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        previewImageView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(previewTitleLabel.snp.bottom).offset(10)
            $0.width.equalTo(245)
            $0.height.equalTo(520)
        }
        
        iphoneLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(previewImageView.snp.bottom).offset(10)
        }
    }

}
