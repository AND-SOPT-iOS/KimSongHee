//
//  EditInfoViewController.swift
//  SOPT
//
//  Created by 김송희 on 11/8/24.
//

import UIKit

class EditInfoViewController: UIViewController {

    private let hobbyTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "New Hobby"
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "New Password"
        return textField
    }()
    
    private let editButton: UIButton = {
        let button = UIButton()
        button.setTitle("Edit", for: .normal)
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
    
    let editService = EditService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
        setTargets()
    }
    
    private func setTargets() {
        editButton.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
    }
    
    private func setStyle() {
        view.backgroundColor = .white
    }
    
    private func setUI() {
        view.addSubviews(hobbyTextField, passwordTextField, editButton, resultLabel)
    }
    
    private func setLayout() {
        hobbyTextField.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(hobbyTextField.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(20)
        }
        
        editButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(60)
        }
        
        resultLabel.snp.makeConstraints {
            $0.top.equalTo(editButton.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
        }
    }
    
    @objc func editButtonTapped() {
        editService.edit(
            token: UserDefaults.standard.string(forKey: "authToken") ?? "",
            hobby: hobbyTextField.text!,
            password: passwordTextField.text!
        ) { [weak self] result in

            DispatchQueue.main.async {
                guard let self = self else { return }
                
                var text: String
                switch result {
                case .success:
                    text = "정보 변경 성공했어요."
                case let .failure(error):
                    text = error.errorMessage
                }
                self.resultLabel.text = text
            }
        }
    }


}
