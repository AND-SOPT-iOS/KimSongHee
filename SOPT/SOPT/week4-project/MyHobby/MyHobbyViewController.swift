//
//  MyHobbyViewController.swift
//  SOPT
//
//  Created by 김송희 on 11/8/24.
//

import UIKit
import Alamofire
import SnapKit
import Then

class MyHobbyViewController: UIViewController {
    
    private let myHobbyButton: UIButton = {
        let button = UIButton()
        button.setTitle("내 취미 조회하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        return button
    }()
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "내 취미는..."
        return label
    }()
    
    let myHobbyService = MyHobbyService()

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
        view.addSubviews(myHobbyButton, resultLabel)
    }
    
    private func setLayout() {
        myHobbyButton.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(60)
        }
        
        resultLabel.snp.makeConstraints {
            $0.top.equalTo(myHobbyButton.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
        }
    }
    
    private func setTargets() {
        myHobbyButton.addTarget(self, action: #selector(hobbyButtonTapped), for: .touchUpInside)
    }
    
    @objc func hobbyButtonTapped() {
        myHobbyService.myHobby(
            token: UserDefaults.standard.string(forKey: "authToken") ?? ""
        ) { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                var text: String
                switch result {
                case let .success(hobby):
                    text = "내 취미는 \(hobby)"
                    
                case let .failure(error):
                    text = error.errorMessage
                }
                self.resultLabel.text = text
            }
        }
        
    }

}
