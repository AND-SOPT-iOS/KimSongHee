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
        return button
    }()
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "8자 이하의 text를 입력해주세요."
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
    
    // signUp 버튼이 눌리면 userService의 register 메서드 호출
    @objc func signUpButtonTapped() {
        userService.register(
            // 입력받은 값을 파라미터로 전달
            username: userNameTextField.text!,
            password: passwordTextField.text!,
            hobby: hobbyTextField.text!
        ) { [weak self] result in
            // 네트워크 요청은 백그라운드 스레드, UI 업데이트는 메인 스레드에서 처리
            DispatchQueue.main.async {
                // self가 존재하는지 확인, 해제된 상태라면 끝
                guard let self = self else { return }
                
                // result 값에 따라 text 변수 설정
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


