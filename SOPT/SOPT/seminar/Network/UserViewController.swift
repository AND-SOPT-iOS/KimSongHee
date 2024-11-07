//
//  UserViewController.swift
//  SOPT
//
//  Created by 김송희 on 11/8/24.
//

import UIKit

class UserViewController: UIViewController {
    
    private let signUpEnterButton: UIButton = {
        let button = UIButton()
        button.setTitle("회원가입 하러가기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        return button
    }()
    
    private let loginEnterButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인 하러가기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        return button
    }()
    
    private let myHobbyEnterButton: UIButton = {
        let button = UIButton()
        button.setTitle("내 취미 찾으러 가기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        return button
    }()
    
    private let hisHobbyEnterButton: UIButton = {
        let button = UIButton()
        button.setTitle("남의 취미 찾으러 가기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        return button
    }()
    
    private let editInfoEnterButton: UIButton = {
        let button = UIButton()
        button.setTitle("내 정보 변경하러 가기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
        setTargets()
    }
    
    private func setTargets() {
        
        signUpEnterButton.addTarget(self, action: #selector(signUpEnterButtonTapped), for: .touchUpInside)
        loginEnterButton.addTarget(self, action: #selector(loginEnterButtonTapped), for: .touchUpInside)
        myHobbyEnterButton.addTarget(self, action: #selector(myHobbyEnterButtonTapped), for: .touchUpInside)
        hisHobbyEnterButton.addTarget(self, action: #selector(hisHobbyEnterButtonTapped), for: .touchUpInside)
        editInfoEnterButton.addTarget(self, action: #selector(editInfoEnterButtonTapped), for: .touchUpInside)
        
    }
    
    private func setStyle() {
        view.backgroundColor = .white
    }
    
    private func setUI() {
        view.addSubviews(signUpEnterButton, loginEnterButton, myHobbyEnterButton, hisHobbyEnterButton, editInfoEnterButton)
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
    
    private func transitionToNextViewController(
    nextViewController: UIViewController) {
        self.navigationController?.pushViewController(
            nextViewController,
            animated: true
        )
    }

}
