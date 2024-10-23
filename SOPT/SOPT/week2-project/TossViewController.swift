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
    private let statView = StatView()
    private let reviewView = ReviewView()
    
    private let firstSeparatorView = UIView()
    private let secondSeparatorView = UIView()
    private let thirdSeparatorView = UIView()
    private let fourthSeparatorView = UIView()
    private let fifthSeparatorView = UIView()
    private let sixthSeparatorView = UIView()
    private let seventhSeparatorView = UIView()
    
    private func setUI() {
        self.view.backgroundColor = .white
        
        firstSeparatorView.backgroundColor = .systemGray4
        secondSeparatorView.backgroundColor = .systemGray4
        thirdSeparatorView.backgroundColor = .systemGray4
        fourthSeparatorView.backgroundColor = .systemGray4
        fifthSeparatorView.backgroundColor = .systemGray4
        sixthSeparatorView.backgroundColor = .systemGray4
        seventhSeparatorView.backgroundColor = .systemGray4
    }
    
    private func setHierarchy() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubviews(titleView, firstSeparatorView, infoView, secondSeparatorView, noticeView, thirdSeparatorView, previewView, fourthSeparatorView, descriptionView, developerView, fifthSeparatorView, statView, sixthSeparatorView, reviewView, seventhSeparatorView)
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
        
        // titleView - infoView 구분선
        firstSeparatorView.snp.makeConstraints {
            $0.top.equalTo(titleView.snp.bottom)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(0.5)
        }
        
        infoView.snp.makeConstraints{
            $0.top.equalTo(firstSeparatorView.snp.bottom)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(100)
        }
        
        // infoView - noticeView 구분선
        secondSeparatorView.snp.makeConstraints {
            $0.top.equalTo(infoView.snp.bottom)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(0.5)
        }
        
        noticeView.snp.makeConstraints{
            $0.top.equalTo(secondSeparatorView.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(150)
        }
        
        // noticeView - previewView 구분선
        thirdSeparatorView.snp.makeConstraints {
            $0.top.equalTo(noticeView.snp.bottom)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(0.5)
        }
        
        previewView.snp.makeConstraints{
            $0.top.equalTo(thirdSeparatorView.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(600)
        }
        
        // previewView - descriptionView 구분선
        fourthSeparatorView.snp.makeConstraints {
            $0.top.equalTo(previewView.snp.bottom)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(0.5)
        }
        
        descriptionView.snp.makeConstraints{
            $0.top.equalTo(fourthSeparatorView.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(100)
        }
        
        developerView.snp.makeConstraints{
            $0.top.equalTo(descriptionView.snp.bottom)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(70)
        }
        
        // developerView - statView 구분선
        fifthSeparatorView.snp.makeConstraints {
            $0.top.equalTo(developerView.snp.bottom)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(0.5)
        }
        
        statView.snp.makeConstraints{
            $0.top.equalTo(fifthSeparatorView.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(150)
        }
        
        // statView - reviewView 구분선
        sixthSeparatorView.snp.makeConstraints {
            $0.top.equalTo(statView.snp.bottom)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(0.5)
        }
        
        reviewView.snp.makeConstraints{
            $0.top.equalTo(sixthSeparatorView.snp.bottom)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(400)
            $0.bottom.equalToSuperview().offset(-20)
        }
        
        // 마지막 구분선
        seventhSeparatorView.snp.makeConstraints {
            $0.top.equalTo(reviewView.snp.bottom)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(0.5)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        setUI()
        setHierarchy()
        setLayout()
        
        noticeView.delegate = self
        statView.delegate = self
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
    func transitionToNoticeViewController() {
        let nextViewController = VersionViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}

extension TossViewController: ReviewViewDelegate {
    func transitionToReviewViewController() {
        let nextViewController = ReviewViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}
