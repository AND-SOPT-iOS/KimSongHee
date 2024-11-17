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
    
    private let myHobbyButton = UIButton().then {
        $0.setTitle("내 취미 조회하기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 15
    }
    
    private let resultLabel = UILabel().then {
        $0.textColor = .black
        $0.text = "검색을 위해 버튼을 눌러주세요"
    }
    
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
