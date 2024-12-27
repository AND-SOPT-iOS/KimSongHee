//
//  FreeAppViewModel.swift
//  SOPT-Project
//
//  Created by 김송희 on 12/6/24.
//

import SwiftUI
import Combine

class FreeAppViewModel: ObservableObject {
    @Published var freeApps: [FreeApp] = []
    
    init() {
        loadMockData()
    }
    
    private func loadMockData() {
        freeApps = FreeApp.mockData
    }
}
