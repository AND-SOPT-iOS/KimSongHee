//
//  RankAppHeaderView.swift
//  SOPT
//
//  Created by 김송희 on 11/1/24.
//

import UIKit

protocol RankAppHeaderViewDelegate: AnyObject {
    func didTapChartViewButton()
}

class RankAppHeaderView: UIView {
    
    weak var delegate: RankAppHeaderViewDelegate?
    
    private let titleLabel = UILabel().then {
        $0.text = "순위"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 24, weight: .bold)
    }
    
    private let chartViewButton = UIButton().then {
        $0.setTitle("모두 보기", for: .normal)
        $0.setTitleColor(.systemBlue, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 18, weight: .regular)
        $0.addTarget(self, action: #selector(chartViewButtonTapped), for: .touchUpInside)
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
        self.addSubviews(titleLabel, chartViewButton)
    }
    
    private func setLayout() {
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(20)
        }
        
        chartViewButton.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel.snp.centerY)
            $0.trailing.equalToSuperview().offset(-20)
        }
    }
    
    func bind(title: String) {
        titleLabel.text = title
    }
    
    @objc private func chartViewButtonTapped() {
        delegate?.didTapChartViewButton()
    }
}
