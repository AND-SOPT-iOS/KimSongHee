//
//  DetailViewController.swift
//  MY-SOPT-Seminar
//
//  Created by 김송희 on 10/11/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private let nicknameTextField: UITextField = {
        let textField = UITextField()
        textField.clearButtonMode = .whileEditing //한번에 지울 수 있는 x버튼
        textField.placeholder = "닉네임을 입력하세요"
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("이전 화면으로", for: .normal)
        button.backgroundColor = .tintColor
        button.setTitleColor(.white, for: .normal)
        // 눌리면 backButtonTapped 메소드 실행
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var textButton: UIButton = {
        let button = UIButton()
        button.setTitle("텍스트 넘기기", for: .normal)
        button.backgroundColor = .tintColor
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(textButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // 전달받은 title과 content를 저장할 string 변수를 옵셔널로 정의
    private var receivedTitle: String?
    private var receivedContent: String?
    
    // 델리게이트 사용해서 데이터 넘기기
    weak var delegate: NicknameDelegate?
    
    // 클로저 사용해서 데이터 넘기기
    var completionHandler: ((String) -> ())?
    
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
        [titleLabel, contentLabel, backButton, nicknameTextField, textButton].forEach {
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
                
                nicknameTextField.topAnchor.constraint(
                    equalTo: backButton.bottomAnchor,
                    constant: 20
                ),
                nicknameTextField.leadingAnchor.constraint(
                    equalTo: view.leadingAnchor,
                    constant: 20
                ),
                nicknameTextField.trailingAnchor.constraint(
                    equalTo: view.trailingAnchor,
                    constant: -20
                ),
                nicknameTextField.heightAnchor.constraint(equalToConstant: 40),
                
                textButton.topAnchor.constraint(equalTo: nicknameTextField.bottomAnchor, constant: 20),
                textButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                textButton.heightAnchor.constraint(equalToConstant: 44),
                textButton.widthAnchor.constraint(equalToConstant: 300),
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
    
    @objc func textButtonTapped() {
        if let nickname = nicknameTextField.text {
            // 델리게이트로 데이터 넘기기
            delegate?.dataBind(nickname: nickname)
            
            // 클로저로 데이터 넘기기
            completionHandler?(nickname)
        }
        
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
