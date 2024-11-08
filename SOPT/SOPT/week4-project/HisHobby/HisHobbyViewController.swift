//
//  HisHobbyViewController.swift
//  SOPT
//
//  Created by 김송희 on 11/8/24.
//

import UIKit
import Alamofire
import SnapKit
import Then

class HisHobbyViewController: UIViewController {
    
    private let userNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "User No."
        return textField
    }()
    
    private let hisHobbyButton: UIButton = {
        let button = UIButton()
        button.setTitle("다른 사람 취미 조회하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 15
        return button
    }()
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "검색하고 싶은 번호를 입력하세요"
        return label
    }()
    
    let hisHobbyService = HisHobbyService()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
        setTargets()
    }
    
    private func setStyle() {
        view.backgroundColor = .white
    }
    
    private func setUI() {
        view.addSubviews(userNameTextField, hisHobbyButton, resultLabel)
    }
    
    private func setLayout() {
        userNameTextField.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(20)
        }
        
        hisHobbyButton.snp.makeConstraints{
            $0.top.equalTo(userNameTextField.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(60)
        }
        
        resultLabel.snp.makeConstraints {
            $0.top.equalTo(hisHobbyButton.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
        }
    }
    
    private func setTargets() {
        hisHobbyButton.addTarget(self, action: #selector(hobbyButtonTapped), for: .touchUpInside)
    }
    
    @objc func hobbyButtonTapped() {
        hisHobbyService.hisHobby(
            token: UserDefaults.standard.string(forKey: "authToken") ?? "",
            no: userNameTextField.text!
        ) { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                var text: String
                switch result {
                case let .success(hobby):
                    text = "그의 취미는 \(hobby)"
                    
                case let .failure(error):
                    text = error.errorMessage
                }
                self.resultLabel.text = text
            }
        }
        
    }

}

