//
//  LoginViewController.swift
//  SOPT
//
//  Created by 김송희 on 11/8/24.
//

import UIKit
import Alamofire
import SnapKit
import Then

class LoginViewController: UIViewController {
    
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
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        return button
    }()
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "user name를 입력해주세요."
        return label
    }()
    
    /*private let hobbyButton: UIButton = {
        let button = UIButton()
        button.setTitle("취미 조회", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.isHidden = true
        return button
    }()*/
    
    let loginService = LoginService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
        setTargets()
    }
    
    private func setTargets() {
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        /*hobbyButton.addTarget(self, action: #selector(hobbyButtonTapped), for: .touchUpInside)*/
    }
    
    private func setStyle() {
        view.backgroundColor = .white
    }
    
    private func setUI() {
        view.addSubviews(userNameTextField, passwordTextField, loginButton, resultLabel)
        // view.addSubview(hobbyButton)
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
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(60)
        }
        
        resultLabel.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
        }
        
        /*hobbyButton.snp.makeConstraints{
            $0.top.equalTo(resultLabel.snp.bottom).offset(40)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(60)
        }*/
    }
    
    @objc func loginButtonTapped() {
        loginService.login(
            username: userNameTextField.text!,
            password: passwordTextField.text!,
            hobby: "123"
        ) { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                var text: String
                switch result {
                case .success:
                    text = "로그인 성공했어요."
                    // self.hobbyButton.isHidden = false
                    
                case let .failure(error):
                    text = error.errorMessage
                }
                self.resultLabel.text = text
            }
        }
    }
    
    /*@objc func hobbyButtonTapped() {
        
        // 토큰 꺼내오기
        guard let token = UserDefaults.standard.string(forKey: "authToken")
        else {return}
        
        let url = Environment.baseURL + "/user/my-hobby"
        let headers: HTTPHeaders = ["token": token]
        
        AF.request(
            url,
            method: .get,
            headers: headers
        )
        .validate()
        .responseData { [weak self] response in
           // Type of expression is ambiguous without a type annotation 에러 발생
            
            guard let statusCode = response.response?.statusCode,
                  let data = response.data,
                  let self
            else {
                self?.resultLabel.text = "취미 조회 실패"
                return
            }
            
            switch response.result {
            case .success:
                do {
                    let hobbyResponse = try JSONDecoder().decode(HobbyResponse.self, from: data)
                    let hobby = hobbyResponse.result.hobby
                    self.resultLabel.text = "취미는 \(hobby)"
                } catch {
                    self.resultLabel.text = "데이터 처리 오류"
                }
                
            case .failure:
                self.resultLabel.text = "통신 실패"
            }
        }
    }*/
}
