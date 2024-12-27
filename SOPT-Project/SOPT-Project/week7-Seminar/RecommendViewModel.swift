//
//  RecommendViewModel.swift
//  SOPT-Project
//
//  Created by 김송희 on 12/6/24.
//

import SwiftUI
import Combine

class RecommendViewModel: ObservableObject {
    
    // @Published 키워드를 붙여 recommends가 변경되면 구독자에게 알림
    @Published var recommends: [Recommend] = []
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        loadMockData()
    }
    
    private func loadMockData() {
        recommends = Recommend.mockData
    }
}
