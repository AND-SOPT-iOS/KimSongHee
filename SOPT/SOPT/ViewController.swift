//
//  ViewController.swift
//  MY-SOPT-Seminar
//
//  Created by 김송희 on 10/11/24.
//

import UIKit

class ViewController: UIViewController {
    // 클로저를 사용하여 선언과 동시에 초기화
    
    // 클래스의 인스턴스 변수 titleLabel 생성
    // UILabel 객체를 참조함
    private let titleLabel: UILabel = {
        
        // 클로저 내부의 지역 변수 label 생성
        // UILabel() 생성자를 호출하여 객체 초기화
        // label 변수는 UILabel 타입의 인스턴스를 갖게 됨
        let label = UILabel()
        label.text = "스위치로 전환 모드 변경"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .tintColor
        return label
    }()
    
    // 짧은 텍스트 입력 필드
    private let titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "제목을 입력해주세요."
        // 입력 중에 텍스트 지울 수 있는 x 버튼
        textField.clearButtonMode = .whileEditing
        textField.textAlignment = .center
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1
        return textField
    }()
    
    // 긴 텍스트 입력 필드
    private let contentTextView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 14)
        textView.layer.borderColor = UIColor.gray.cgColor
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 10
        
        // 그림자 추가
        textView.backgroundColor = .clear
        textView.layer.shadowColor = UIColor.gray.cgColor
        textView.layer.shadowOpacity = 0.5
        textView.layer.shadowOffset = CGSize(width: 2, height: 2)
        textView.layer.shadowRadius = 5
        return textView
    }()
    
    // 다음 버튼
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("다음", for: .normal)
        button.backgroundColor = .tintColor
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        
        // 버튼이 눌렸을 경우 수행할 작업
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let toggleSwitch: UISwitch = {
        let modeSwitch = UISwitch()
        modeSwitch.isOn = true
        modeSwitch.onTintColor = .tintColor
        modeSwitch.addTarget(ViewController.self, action: #selector(switchToggled), for: .valueChanged)
        return modeSwitch
    }()
    
    // 뷰가 메모리에 로드된 후 호출되는 메소드
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
    }
    
    // viewDidLoad()에서 호출됨
    // 기본 뷰의 배경색 설정
    private func setStyle() {
        self.view.backgroundColor = .white
    }
    
    // viewDidLoad()에서 호출됨
    // 각 컴포넌트의 프레임 기반 레이아웃을 비활성화하고, 오토 레이아웃 사용
    // 기본 뷰에 각 컴포넌트 추가
    private func setUI() {
        [titleLabel, titleTextField, contentTextView, nextButton, toggleSwitch].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
    }
    
    // viewDidLoad()에서 호출됨
    // 각 UI 컴포넌트의 위치와 크기 설정
    // 오토레이아웃 사용
    private func setLayout() {
        NSLayoutConstraint.activate(
            [
                // Label (좌측 정렬)
                titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20), // 좌측 정렬
                            
                // Switch (우측 정렬)
                toggleSwitch.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor), // 수직 중앙 정렬
                toggleSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20), // 우측 정렬
                
                // TextField
                titleTextField.topAnchor.constraint(
                    equalTo: titleLabel.bottomAnchor,
                    constant: 20
                ),
                titleTextField.leadingAnchor.constraint(
                    equalTo: view.leadingAnchor,
                    constant: 20
                ),
                titleTextField.trailingAnchor.constraint(
                    equalTo: view.trailingAnchor,
                    constant: -20
                ),
                titleTextField.heightAnchor.constraint(equalToConstant: 40),
                
                // TextView
                contentTextView.topAnchor.constraint(
                    equalTo: titleTextField.bottomAnchor,
                    constant: 20
                ),
                contentTextView.leadingAnchor.constraint(
                    equalTo: view.leadingAnchor,
                    constant: 20
                ),
                contentTextView.trailingAnchor.constraint(
                    equalTo: view.trailingAnchor,
                    constant: -20
                ),
                contentTextView.heightAnchor.constraint(
                    equalToConstant: 200
                ),
                
                // Button
                nextButton.topAnchor.constraint(
                    equalTo: contentTextView.bottomAnchor,
                    constant: 20
                ),
                nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                nextButton.heightAnchor.constraint(equalToConstant: 50),
                nextButton.widthAnchor.constraint(equalToConstant: 100),
                
            ]
        )
    }
    
    private func updateUI() {
        // toggleSwitch가 켜져 있어서 true이면 textLabel에 네비게이션을, false이면 모달을 띄운다
        self.titleLabel.text = self.toggleSwitch.isOn ? "지금은 네비게이션" : "지금은 모달"
    }
    
    @objc func nextButtonTapped() {
        transitionToNextViewController()
    }
    
    private func transitionToNextViewController() {
        let nextViewController = DetailViewController()
        
        // guard let으로 옵셔널 값을 안전하게 추출
        guard let title = titleTextField.text,
              let content = contentTextView.text
        else {
            // 텍스트 값이 비어 있으면 그대로 return
            return
        }
        
        // 텍스트 값이 존재하면 dataBind 메소드 실행
        nextViewController.dataBind(
            title: title,
            content: content
        )
        
        // toggleSwitch가 켜져 있으면 navigationController에 nextViewController를 push
        if self.toggleSwitch.isOn {
            self.navigationController?.pushViewController(
                nextViewController,
                animated: true
            )
            // toggleSwitch가 꺼져 있으면 기존 화면을 덮고 nextViewController가 뜨도록
        } else {
            self.present(
                nextViewController,
                animated: true
            )
        }
    }
    
    @objc func toggleButtonTapped() {
        // toggleSwitch를 off로 변경
        self.toggleSwitch.isOn = false
        self.updateUI()
    }
    
    @objc func switchToggled() {
        self.updateUI()
    }
}
