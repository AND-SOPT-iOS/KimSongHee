//
//  SignUpViewController.swift
//  SOPT
//
//  Created by 김송희 on 11/6/24.
//

import UIKit

import SnapKit
import Then

class SignUpViewController: UIViewController {
    
    private let userNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "User Name"
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        return textField
    }()
    
    private let hobbyTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Hobby"
        return textField
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 15
        return button
    }()
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "모든 정보는 8자 이하로 입력해주세요."
        return label
    }()
    
    let userService = SignUpService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
        setTargets()
    }
    
    private func setTargets() {
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }
    
    private func setStyle() {
        view.backgroundColor = .white
    }
    
    private func setUI() {
        view.addSubviews(userNameTextField, passwordTextField, hobbyTextField, signUpButton, resultLabel)
    }
    
    private func setLayout() {
        userNameTextField.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(userNameTextField.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(20)
        }
        
        hobbyTextField.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(20)
        }
        
        signUpButton.snp.makeConstraints {
            $0.top.equalTo(hobbyTextField.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(60)
        }
        
        resultLabel.snp.makeConstraints {
            $0.top.equalTo(signUpButton.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
        }
    }
    
    @objc func signUpButtonTapped() {
        userService.register(
            username: userNameTextField.text!,
            password: passwordTextField.text!,
            hobby: hobbyTextField.text!
        ) { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                var text: String
                switch result {
                case .success:
                    text = "회원 등록 성공했어요."
                case let .failure(error):
                    text = error.errorMessage
                }
                self.resultLabel.text = text
            }
        }
    }
}


