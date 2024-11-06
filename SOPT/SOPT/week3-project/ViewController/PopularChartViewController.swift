//
//  PopularChartViewController.swift
//  SOPT
//
//  Created by 김송희 on 11/1/24.
//

import UIKit

class PopularChartViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private var contentView = UIView()
    
    private var freeAppList = FreeApp.mockData
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        setUI()
        setTableView()
        setHierarchy()
        setLayout()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        let defaultAppearance = UINavigationBarAppearance()
        defaultAppearance.configureWithDefaultBackground()
        navigationController?.navigationBar.standardAppearance = defaultAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = defaultAppearance
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    private func setUI() {
        self.view.backgroundColor = .white
        scrollView.showsVerticalScrollIndicator = false
    }
    
    private func setTableView() {
        tableView.do {
            $0.register(
                PopularChartCell.self,
                forCellReuseIdentifier: PopularChartCell.identifier
            )
            $0.rowHeight = 70
            $0.delegate = self
            $0.dataSource = self
        }
    }
    
    private func setHierarchy() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(tableView)
    }
    
    private func setLayout() {
        
        scrollView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints{
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(scrollView)
        }
        
        tableView.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(1600)
            $0.bottom.equalToSuperview()
        }
    }
    
    @objc func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension PopularChartViewController {
    private func setNavigationBar() {
        
        self.navigationItem.title = "인기 차트"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.systemGray6.withAlphaComponent(0.9)
        appearance.shadowColor = nil
        
        // 왼쪽 뒤로가기 버튼
        let backButton = UIButton(type: .system)
        backButton.setTitle(" 금융", for: .normal)
        backButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.tintColor = .systemBlue
        backButton.sizeToFit()
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        let backBarButtonItem = UIBarButtonItem(customView: backButton)
        self.navigationItem.leftBarButtonItem = backBarButtonItem
        
        // 오른쪽 카테고리 변경 버튼
        let categoryButton = UIButton(type: .system).then {
            $0.setTitle("금융", for: .normal)
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
            $0.tintColor = .systemBlue
        }
        
        let categoryBarButtonItem = UIBarButtonItem(customView: categoryButton)
        self.navigationItem.rightBarButtonItem = categoryBarButtonItem
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
        self.navigationController?.navigationBar.compactAppearance = appearance
        
    }
}

extension PopularChartViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let tossViewController = TossViewController()
            navigationController?.pushViewController(tossViewController, animated: true)
        }
    }
}

extension PopularChartViewController: UITableViewDataSource {
    
    // 섹션별로 해당 섹션의 행 수를 반환하는 메소드
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return freeAppList.count
    }
    
    // 각 행의 셀 객체를 반환하는 메소드
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: PopularChartCell.identifier,
            for: indexPath
        ) as? PopularChartCell else { return UITableViewCell() }
        
        cell.selectionStyle = .none
        cell.freeAppBind(freeAppList[indexPath.row])
        return cell
    }
}

