//
//  FreeAppRowView.swift
//  SOPT-Project
//
//  Created by 김송희 on 12/6/24.
//

import SwiftUI

struct FreeAppRowView: View {
    let app: FreeApp
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            appIcon
            ranking
            appTitles
            Spacer()
            downloadButton
        }
        .padding(.vertical, 8)
    }
    
    private var appIcon: some View {
        Image(uiImage: app.icon)
            .resizable()
            .scaledToFit()
            .frame(width: 60, height: 60)
            .cornerRadius(15)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
            )
            .padding(.leading, 20)
    }
    
    private var ranking: some View {
        VStack() {
            Text(app.ranking)
                .font(.system(size: 20, weight: .semibold))
        }
    }
    
    private var appTitles: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(app.title)
                .font(.system(size: 18, weight: .regular))
                .foregroundColor(.primary)
                .lineLimit(2)
            
            Text(app.subtitle)
                .font(.system(size: 14))
                .foregroundColor(.secondary)
                .lineLimit(2)
        }
    }
    
    private var downloadButton: some View {
        Button(action: {}) {
            Text("받기")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.blue)
                .frame(width: 80, height: 35)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(18)
        }
        .padding(.trailing, 20)
        .padding(.vertical)
    }
}

struct FreeAppRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FreeAppRowView(app: FreeApp.mockData[0])
                .previewLayout(.sizeThatFits)
        }
    }
}

