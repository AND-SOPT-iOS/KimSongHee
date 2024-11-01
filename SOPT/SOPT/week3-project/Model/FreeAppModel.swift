//
//  FreeAppModel.swift
//  SOPT
//
//  Created by 김송희 on 11/1/24.
//

import UIKit

struct FreeApp: Hashable {
    let icon: UIImage
    let ranking: String
    let title: String
    let subtitle: String
}


extension FreeApp {
    static let mockData: [FreeApp] = [
        FreeApp(icon: UIImage(resource: .tossIcon), ranking: "1", title: "토스", subtitle: "금융이 쉬워진다"),
        FreeApp(icon: UIImage(resource: .essentialCardPointers), ranking: "2", title: "네이버페이", subtitle: "지갑 없이 매장에서 결제"),
        FreeApp(icon: UIImage(resource: .essentialYNAB), ranking: "3", title: "카카오페이", subtitle: "마음 놓고 금융하다"),
        FreeApp(icon: UIImage(resource: .essentialMoneyCoach), ranking: "4", title: "KB Pay", subtitle: "모든 금융을 한번에, 한손에, 한눈에 담다"),
        FreeApp(icon: UIImage(resource: .essentialSpendy), ranking: "5", title: "monimo (모니모, 삼성금융네트웍스)", subtitle: "모이는 금융, 커지는 혜택!"),
        FreeApp(icon: UIImage(resource: .essentialSplitWise), ranking: "6", title: "NH올원뱅크", subtitle: "초스피드 계좌이체"),
        FreeApp(icon: UIImage(resource: .essentialBuddy), ranking: "7", title: "KB스타뱅킹", subtitle: "모바일신분증, 결제, 통신도 다 되는 은행"),
        FreeApp(icon: UIImage(resource: .essentialMarketWatch), ranking: "8", title: "하나은행, 하나원큐는 돈기운 가득한 은행 앱", subtitle: "송금, 해외송금, 유학생송금"),
        FreeApp(icon: UIImage(resource: .essentialIFinance6), ranking: "9", title: "빗썸", subtitle: "No.1 가상자산 플랫폼"),
    ]
}
