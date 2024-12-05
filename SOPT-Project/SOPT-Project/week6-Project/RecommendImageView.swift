//
//  RecommendImageView.swift
//  SOPT-Project
//
//  Created by 김송희 on 11/29/24.
//

import SwiftUI

struct RecommendImageView: View {
    let backgroundImage: Image
    let iconImage: Image
    let title: String
    let subtitle: String
    
    var body: some View {
        ZStack {
            backgroundLayer
            contentLayer
        }
        .frame(width: 350, height: 250)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
    }
    
    private var backgroundLayer: some View {
        backgroundImage
            .resizable()
            .scaledToFit()
            .frame(width: 350, height: 250)
            .cornerRadius(10)
    }
    
    private var contentLayer: some View {
        VStack {
            Spacer()
            HStack {
                appIcon
                appTitles
                Spacer()
                downloadButton
            }
            .padding(.horizontal, 10)
            .padding(.bottom, 20)
        }
    }
    
    private var appIcon: some View {
        iconImage
            .resizable()
            .scaledToFit()
            .frame(width: 40, height: 40)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
    
    private var appTitles: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .lineLimit(1)
            
            Text(subtitle)
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.8))
                .lineLimit(1)
        }
    }
    
    private var downloadButton: some View {
        Button(action: {}) {
            Text("받기")
                .font(.headline)
                .foregroundColor(.white)
                .frame(width: 60, height: 30)
                .background(Color.white.opacity(0.3))
                .cornerRadius(15)
        }
    }
}

struct RecommendImageView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendImageView(
            backgroundImage: Image("ic_taxnote"),
            iconImage: Image("ic_taxnote"),
            title: "Taxnote 부기 및 회계 앱",
            subtitle: "자영업자용 세금 환급을 위한 부기 관리"
        )
        .previewLayout(.sizeThatFits)
    }
}
