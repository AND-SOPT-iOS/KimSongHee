//
//  PopularChartView.swift
//  SOPT-Project
//
//  Created by 김송희 on 12/6/24.
//

import SwiftUI

struct PopularChartView: View {
    @StateObject private var viewModel = FreeAppViewModel()
    @State private var isTossViewActive = false
    
    var body: some View {
        NavigationStack {
            List(viewModel.freeApps.indices, id: \.self) { index in
                let app = viewModel.freeApps[index]
                FreeAppRowView(app: app)
                    .listRowInsets(EdgeInsets())
                    .contentShape(Rectangle())
                    .onTapGesture {
                        if index == 0 {
                            isTossViewActive = true
                        }
                    }
            }
            .listStyle(.plain)
            .buttonStyle(PlainButtonStyle())
            .navigationDestination(isPresented: $isTossViewActive) {
                TossViewControllerWrapper()
                    .navigationBarHidden(true)
            }
        }
        .padding(.top, 1)
    }
}

struct TossViewControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> TossViewController {
        return TossViewController()
    }
    
    func updateUIViewController(_ uiViewController: TossViewController, context: Context) {}
}

struct PopularChartView_Previews: PreviewProvider {
    static var previews: some View {
        PopularChartView()
    }
}
