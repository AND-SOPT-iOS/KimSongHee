//
//  ReviewViewController.swift
//  SOPT
//
//  Created by 김송희 on 10/23/24.
//

import UIKit

class ReviewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let titleLabel = UILabel()
        titleLabel.text = "평가 및 리뷰"
        titleLabel.font = UIFont.systemFont(ofSize: 38, weight: .bold)
        self.view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalToSuperview().offset(100)
        }
    }
    


}
