//
//  FinanceAppViewController.swift
//  SOPT
//
//  Created by 김송희 on 10/31/24.
//

import UIKit

class FinAppViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private var contentView = UIView()
    
    private let recommendViewController = RecommendViewController()
    /*private let editorPickView = UICollectionView()
    private let paidView = UICollectionView()
    private let freeView = UICollectionView()*/

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        setStyle()
        setUI()
        setHierarchy()
        setLayout()
        
    }
    
    private func setStyle() {
        self.view.backgroundColor = .white
    }
    
    private func setUI() {

    }
    
    private func setHierarchy() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(recommendViewController.view)
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
            $0.edges.equalTo(contentView)
            $0.width.equalTo(contentView)
        }

    }

    
    @objc func backButtonTapped() {
        // self.navigationController?.popViewController(animated: true)
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
