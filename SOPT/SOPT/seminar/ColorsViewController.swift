//
//  ColorsViewController.swift
//  SOPT-Seminar
//
//  Created by 김송희 on 10/12/24.
//

import UIKit
import SnapKit

class ColorsViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private var contentView = UIView()
    
    private let redView = UIView()
    private let orangeView = UIView()
    private let yellowView = UIView()
    private let greenView = UIView()
    private let blueView = UIView()
    private let purpleView = UIView()
    
    private func setUI() {
        redView.backgroundColor = .red
        orangeView.backgroundColor = .orange
        yellowView.backgroundColor = .yellow
        greenView.backgroundColor = .green
        blueView.backgroundColor = .blue
        purpleView.backgroundColor = .purple
    }
    
    private func setHierarchy() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubviews(redView, orangeView, yellowView, greenView, blueView, purpleView)
        
    }
    
    private func setLayout() {
        scrollView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints{
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(scrollView)
        }
        
        redView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(0)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(400)
        }
        
        orangeView.snp.makeConstraints{
            $0.top.equalTo(redView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(400)
        }
        
        yellowView.snp.makeConstraints{
            $0.top.equalTo(orangeView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(400)
        }
        
        greenView.snp.makeConstraints{
            $0.top.equalTo(yellowView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(400)
        }
        
        blueView.snp.makeConstraints{
            $0.top.equalTo(greenView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(400)
        }
        
        purpleView.snp.makeConstraints{
            $0.top.equalTo(blueView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(400)
            $0.bottom.equalToSuperview().offset(-50)
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
        setUI()
        setHierarchy()
        setLayout()
    }
    

}
