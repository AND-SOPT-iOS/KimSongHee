//
//  RankAppCell.swift
//  SOPT
//
//  Created by 김송희 on 11/1/24.
//

import UIKit

class RankAppCell: UICollectionViewCell {
    
    static let identifier = "RankAppCell"
    
    private let appIcon = UIImageView().then {
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.systemGray5.cgColor
        $0.layer.cornerRadius = 15
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFit
    }
    
    private let ranking = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 20, weight: .semibold)
    }
    
    private let verticalStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .top
        $0.distribution = .fill
        $0.spacing = 4
    }
    
    private let titleLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 20, weight: .regular)
        $0.numberOfLines = 2
        $0.lineBreakMode = .byTruncatingTail
    }
    
    private let subtitleLabel = UILabel().then {
        $0.textColor = .systemGray
        $0.font = .systemFont(ofSize: 15, weight: .regular)
        $0.numberOfLines = 2
        $0.lineBreakMode = .byTruncatingTail
    }
    
    private let downloadButton = UIButton().then {
        $0.setTitle("받기", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        $0.setTitleColor(.systemBlue, for: .normal)
        $0.backgroundColor = .systemGray6
        $0.layer.cornerRadius = 18
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
        addSubviews(appIcon, ranking, verticalStackView, downloadButton)
        verticalStackView.addArrangedSubviews(titleLabel, subtitleLabel)
    }
    
    private func setLayout() {
        appIcon.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.size.equalTo(60)
        }
        
        ranking.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.equalTo(appIcon.snp.trailing).offset(10)
        }
        
        verticalStackView.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.equalTo(ranking.snp.trailing).offset(10)
            $0.trailing.equalTo(downloadButton.snp.leading).offset(-8)
        }
        
        downloadButton.snp.makeConstraints{
            $0.centerY.equalTo(appIcon.snp.centerY)
            $0.trailing.equalToSuperview()
            $0.width.equalTo(80)
            $0.height.equalTo(35)
        }
    }
    
    func paidAppBind(_ mockData: PaidApp) {
        appIcon.image = mockData.icon
        ranking.text = mockData.ranking
        titleLabel.text = mockData.title
        subtitleLabel.text = mockData.subtitle
        downloadButton.setTitle(mockData.price, for: .normal)
        downloadButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
    }
    
    func freeAppBind(_ mockData: FreeApp) {
        appIcon.image = mockData.icon
        ranking.text = mockData.ranking
        titleLabel.text = mockData.title
        subtitleLabel.text = mockData.subtitle
    }
    
}

