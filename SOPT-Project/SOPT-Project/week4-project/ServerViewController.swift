//
//  ServerViewController.swift
//  SOPT
//
//  Created by 김송희 on 11/8/24.
//

import UIKit

class ServerViewController: UIViewController {
    
    private let signUpEnterButton = UIButton().then {
        $0.setTitle("회원가입 하러가기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 15
    }
    
    private let loginEnterButton = UIButton().then {
        $0.setTitle("로그인 하러가기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 15
    }
    
    private let myHobbyEnterButton = UIButton().then {
        $0.setTitle("내 취미 찾으러 가기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 15
    }
    
    private let hisHobbyEnterButton = UIButton().then {
        $0.setTitle("남의 취미 찾으러 가기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 15
    }
    
    private let editInfoEnterButton = UIButton().then {
        $0.setTitle("내 정보 변경하러 가기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 15
    }
    
    private let logoutButton = UIButton().then {
        $0.setTitle("로그아웃하기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 15
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
        setTargets()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateButtonVisibility()
    }
    
    private func updateButtonVisibility() {
        let isLoggedIn = UserDefaults.standard.string(forKey: "authToken") != nil
        
        myHobbyEnterButton.isHidden = !isLoggedIn
        hisHobbyEnterButton.isHidden = !isLoggedIn
        editInfoEnterButton.isHidden = !isLoggedIn
        logoutButton.isHidden = !isLoggedIn
        
        signUpEnterButton.isHidden = isLoggedIn
        loginEnterButton.isHidden = isLoggedIn
    }
    
    private func setTargets() {
        signUpEnterButton.addTarget(self, action: #selector(signUpEnterButtonTapped), for: .touchUpInside)
        loginEnterButton.addTarget(self, action: #selector(loginEnterButtonTapped), for: .touchUpInside)
        myHobbyEnterButton.addTarget(self, action: #selector(myHobbyEnterButtonTapped), for: .touchUpInside)
        hisHobbyEnterButton.addTarget(self, action: #selector(hisHobbyEnterButtonTapped), for: .touchUpInside)
        editInfoEnterButton.addTarget(self, action: #selector(editInfoEnterButtonTapped), for: .touchUpInside)
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
    }
    
    private func setStyle() {
        view.backgroundColor = .white
    }
    
    private func setUI() {
        view.addSubviews(signUpEnterButton, loginEnterButton, myHobbyEnterButton, hisHobbyEnterButton, editInfoEnterButton, logoutButton)
    }
    
    private func setLayout() {
        signUpEnterButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(60)
        }
        
        loginEnterButton.snp.makeConstraints {
            $0.top.equalTo(signUpEnterButton.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(60)
        }
        
        myHobbyEnterButton.snp.makeConstraints {
            $0.top.equalTo(loginEnterButton.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(60)
        }
        
        hisHobbyEnterButton.snp.makeConstraints {
            $0.top.equalTo(myHobbyEnterButton.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(60)
        }
        
        editInfoEnterButton.snp.makeConstraints {
            $0.top.equalTo(hisHobbyEnterButton.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(60)
        }
        
        logoutButton.snp.makeConstraints {
            $0.top.equalTo(editInfoEnterButton.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(60)
        }
    }
    
    private func transitionToNextViewController(
        nextViewController: UIViewController) {
            self.navigationController?.pushViewController(
                nextViewController,
                animated: true
            )
        }
    
    @objc func signUpEnterButtonTapped() {
        transitionToNextViewController(
            nextViewController: SignUpViewController()
        )
    }
    
    @objc func loginEnterButtonTapped() {
        transitionToNextViewController(
            nextViewController: LoginViewController()
        )
    }
    
    @objc func myHobbyEnterButtonTapped() {
        transitionToNextViewController(
            nextViewController: MyHobbyViewController()
        )
    }
    
    @objc func hisHobbyEnterButtonTapped() {
        transitionToNextViewController(
            nextViewController: HisHobbyViewController()
        )
    }
    
    @objc func editInfoEnterButtonTapped() {
        transitionToNextViewController(
            nextViewController: EditInfoViewController()
        )
    }
    
    @objc func logoutButtonTapped() {
        UserDefaults.standard.removeObject(forKey: "authToken")
        
        updateButtonVisibility()
        view.layoutIfNeeded()
    }
    
}
