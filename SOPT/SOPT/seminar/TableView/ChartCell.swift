//
//  ChartCell.swift
//  SOPT
//
//  Created by 김송희 on 10/30/24.
//

import UIKit
import SnapKit
import Then

class ChartCell: UITableViewCell {
    
    // 재사용 큐를 위한 식별자 정의
    static let identifier = "ChartCell"
    
    private let verticalStackView = UIStackView()
    private let iconImageView = UIImageView()
    private let rankingLabel = UILabel()
    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()
    private let downloadButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        titleLabel.do {
            $0.numberOfLines = 2
        }
        verticalStackView.do {
            $0.axis = .vertical
            $0.alignment = .top
            $0.distribution = .equalSpacing
            $0.spacing = 4
        }
    }
    
    private func setUI() {
        [
            iconImageView,
            rankingLabel,
            verticalStackView,
            downloadButton
        ].forEach { addSubview($0) }
        
        [
            titleLabel,
            subTitleLabel
        ].forEach { verticalStackView.addArrangedSubview($0) }
    }
    
    private func setLayout() {
        iconImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.size.equalTo(80)
        }
        
        rankingLabel.snp.makeConstraints {
            $0.leading.equalTo(iconImageView.snp.trailing).offset(8)
            $0.top.equalToSuperview().offset(12)
        }
        
        verticalStackView.snp.makeConstraints {
            $0.leading.equalTo(rankingLabel.snp.trailing).offset(8)
            $0.trailing.equalTo(downloadButton.snp.leading).offset(-20)
            $0.top.equalToSuperview().inset(12)
            $0.bottom.greaterThanOrEqualToSuperview().inset(12)
        }
        
        downloadButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-20)
            $0.width.equalTo(44)
            $0.height.equalTo(20)
        }
    }
    
    func configure(app: App) {
        iconImageView.image = app.iconImage
        rankingLabel.text = app.ranking.description
        titleLabel.text = app.title
        subTitleLabel.text = app.subtitle
        downloadButton.setTitle(app.downloadState.title, for: .normal)
    }
    
}
