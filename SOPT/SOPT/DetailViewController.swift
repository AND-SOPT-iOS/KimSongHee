//
//  DetailViewController.swift
//  MY-SOPT-Seminar
//
//  Created by 김송희 on 10/11/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    // titleLabel
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    // contentLabel
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    // backButton
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("이전 화면으로", for: .normal)
        button.backgroundColor = .tintColor
        button.setTitleColor(.white, for: .normal)
        // 눌리면 backButtonTapped 메소드 실행
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // 전달받은 title과 content를 저장할 string 변수를 옵셔널로 정의
    private var receivedTitle: String?
    private var receivedContent: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
    }
    
    private func setStyle() {
        self.view.backgroundColor = .white
    }
    
    private func setUI() {
        [titleLabel, contentLabel, backButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
    }
    
    private func setLayout() {
        NSLayoutConstraint.activate(
            [
                titleLabel.topAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.topAnchor,
                    constant: 20
                ),
                titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                contentLabel.topAnchor.constraint(
                    equalTo: titleLabel.bottomAnchor,
                    constant: 20
                ),
                contentLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                backButton.topAnchor.constraint(
                    equalTo: contentLabel.bottomAnchor,
                    constant: 20
                ),
                backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                backButton.heightAnchor.constraint(equalToConstant: 44),
                backButton.widthAnchor.constraint(equalToConstant: 300),
            ]
        )
    }
    
    // 새로운 값으로 UI 업데이트
    func updateUI() {
        self.titleLabel.text = receivedTitle
        self.contentLabel.text = receivedContent
    }
    
    // ViewController의 외부에서 데이터를 전달하고, 그 데이터를 UI에 반영
    func dataBind(
        // 매개변수를 외부에서 전달받은 문자열로
        title: String,
        content: String
    ) {
        // 현재 ViewController에 외부에서 전달받은 값 전달
        self.receivedTitle = title
        self.receivedContent = content
        updateUI()
    }
    
    
    @objc func backButtonTapped() {
        // navigationController가 비어 있으면 (= modal이면)
        if self.navigationController == nil {
            // modal을 dismiss
            self.dismiss(animated: true)
            // navigationController가 설정되어 있으면
        } else {
            // navigationController를 pop
            self.navigationController?.popViewController(animated: true)
        }
    }
}
