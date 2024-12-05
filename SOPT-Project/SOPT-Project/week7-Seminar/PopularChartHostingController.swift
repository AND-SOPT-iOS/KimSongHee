//
//  PopularChartHostingController.swift
//  SOPT-Project
//
//  Created by 김송희 on 12/6/24.
//

import SwiftUI

class PopularChartHostingController<Content>: UIHostingController<Content> where Content: View {
    private var previousAppearance: UINavigationBarAppearance?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // 기존 Appearance를 저장
        if let navigationBar = navigationController?.navigationBar {
            previousAppearance = navigationBar.standardAppearance
        }

        // 새로운 Appearance 설정
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.systemGray6
        appearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.black,
            .font: UIFont.boldSystemFont(ofSize: 34)
        ]

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // 이전 Appearance로 복원
        if let navigationBar = navigationController?.navigationBar, let previousAppearance = previousAppearance {
            navigationBar.standardAppearance = previousAppearance
            navigationBar.scrollEdgeAppearance = previousAppearance
        }
        navigationController?.navigationBar.prefersLargeTitles = false
    }
}


