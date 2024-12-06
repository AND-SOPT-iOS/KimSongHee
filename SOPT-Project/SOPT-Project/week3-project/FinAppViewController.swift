//
//  FinanceAppViewController.swift
//  SOPT
//
//  Created by 김송희 on 10/31/24.
//

import UIKit
import SwiftUI

class FinAppViewController: UIViewController, FreeAppViewControllerDelegate, RankAppHeaderViewDelegate {
    
    private let scrollView = UIScrollView()
    private var contentView = UIView()
    
    private let recommendViewController = RecommendViewController()
    private let essentialAppViewController = EssentialAppViewController()
    private let paidAppViewController = PaidAppViewController()
    private let freeAppViewController = FreeAppViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        setStyle()
        setHierarchy()
        setLayout()
        
        freeAppViewController.delegate = self
        freeAppViewController.freeAppHeaderView.delegate = self
    }
    
    private func setStyle() {
        self.view.backgroundColor = .white
        scrollView.showsVerticalScrollIndicator = false
    }
    
    private func setHierarchy() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(recommendViewController.view, essentialAppViewController.view, paidAppViewController.view, freeAppViewController.view)
    }
    
    private func setLayout() {
        scrollView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints{
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(scrollView)
        }
        
        recommendViewController.view.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(350)
        }
        
        essentialAppViewController.view.snp.makeConstraints{
            $0.top.equalTo(recommendViewController.view.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(350)
        }
        
        paidAppViewController.view.snp.makeConstraints{
            $0.top.equalTo(essentialAppViewController.view.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(350)
        }
        
        freeAppViewController.view.snp.makeConstraints{
            $0.top.equalTo(paidAppViewController.view.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(350)
            $0.bottom.equalToSuperview().offset(-20)
        }
        
        
    }
    
    
    @objc func backButtonTapped() {
        // self.navigationController?.popViewController(animated: true)
    }
    
    func didSelectToss() {
        let tossViewController = TossViewController()
        navigationController?.pushViewController(tossViewController, animated: true)
    }
    
    func didTapChartViewButton() {
        let popularChartView = PopularChartView()
        let hostingController = UIHostingController(rootView: popularChartView)
        hostingController.title = "인기 차트"
        navigationController?.pushViewController(hostingController, animated: true)
    }
}

extension FinAppViewController {
    private func setNavigationBar() {
        self.navigationItem.title = "금융"
        
        let backButton = UIButton(type: .system)
        backButton.setTitle(" 앱", for: .normal)
        backButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.tintColor = .systemBlue
        backButton.sizeToFit()
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        let backBarButtonItem = UIBarButtonItem(customView: backButton)
        self.navigationItem.leftBarButtonItem = backBarButtonItem
    }
}
