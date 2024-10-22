//
//  TossViewController.swift
//  SOPT
//
//  Created by 김송희 on 10/17/24.
//

import UIKit

class TossViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private var contentView = UIView()
    
    private let titleView = TitleView()
    private let infoView = InfoView()
    private let noticeView = NoticeView()
    private let previewView = PreviewView()
    private let descriptionView = DescriptionView()
    private let developerView = DeveloperView()
    private let reviewStatView = UIView()
    private let reviewView = UIView()
    
    private func setUI() {
        self.view.backgroundColor = .white
        
        titleView.backgroundColor = .white
        infoView.backgroundColor = .white
        noticeView.backgroundColor = .white
        previewView.backgroundColor = .white
        descriptionView.backgroundColor = .white
        developerView.backgroundColor = .white
        reviewStatView.backgroundColor = .brown
        reviewView.backgroundColor = .gray
    }
    
    private func setHierarchy() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubviews(titleView, infoView, noticeView, previewView, descriptionView, developerView, reviewStatView, reviewView)
    }
    
    private func setLayout() {
        scrollView.snp.makeConstraints{
            // edges는 모든 가장자리 (top, bottom, leading, trailing)
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints{
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(scrollView)
        }
        
        titleView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(0)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(150)
        }
        
        infoView.snp.makeConstraints{
            $0.top.equalTo(titleView.snp.bottom)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(100)
        }
        
        noticeView.snp.makeConstraints{
            $0.top.equalTo(infoView.snp.bottom)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(150)
        }
        
        previewView.snp.makeConstraints{
            $0.top.equalTo(noticeView.snp.bottom)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(600)
        }
        
        descriptionView.snp.makeConstraints{
            $0.top.equalTo(previewView.snp.bottom)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(100)
        }
        
        developerView.snp.makeConstraints{
            $0.top.equalTo(descriptionView.snp.bottom)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(100)
        }
        
        reviewStatView.snp.makeConstraints{
            $0.top.equalTo(developerView.snp.bottom)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(150)
        }
        
        reviewView.snp.makeConstraints{
            $0.top.equalTo(reviewStatView.snp.bottom)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(400)
            $0.bottom.equalToSuperview().offset(-20)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        setUI()
        setHierarchy()
        setLayout()
        
        noticeView.delegate = self
    }
    
    @objc func backButtonTapped() {
        // 뒤로가기(검색) 버튼 눌렀을 때 동작
        // self.navigationController?.popViewController(animated: true)
    }
    
}

extension TossViewController {
    private func setNavigationBar() {
        // 화살표 아이콘과 검색 텍스트
        let backButton = UIButton(type: .system)
        backButton.setTitle(" 검색", for: .normal)
        backButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)  // 화살표 아이콘
        backButton.tintColor = .systemBlue
        backButton.sizeToFit() // 버튼 크기를 텍스트, 이미지에 맞게 자동 조절
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        // UIButton을 UIBarButtonItem으로 감싸기
        // 네비게이션 바에는 UIButton을 직접 배치할 수 없음
        let backBarButtonItem = UIBarButtonItem(customView: backButton)
        self.navigationItem.leftBarButtonItem = backBarButtonItem
    }
}

extension TossViewController: NoticeViewDelegate {
    func transitionToNextViewController() {
        let nextViewController = VersionRecordViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}
