//
//  RecommendImageView.swift
//  SOPT-Project
//
//  Created by 김송희 on 11/29/24.
//

import SwiftUI

struct RecommendImageView: View {
    let recommend: Recommend
    
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
        Image(uiImage: recommend.image)
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
        Image(uiImage: recommend.icon)
            .resizable()
            .scaledToFit()
            .frame(width: 40, height: 40)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
    
    private var appTitles: some View {
        VStack(alignment: .leading) {
            Text(recommend.title)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .lineLimit(1)
            
            Text(recommend.subtitle)
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
