//
//  PaidAppModel.swift
//  SOPT
//
//  Created by 김송희 on 11/1/24.
//

import UIKit

struct PaidApp: Hashable {
    let icon: UIImage
    let ranking: String
    let title: String
    let subtitle: String
    let price: String
}


extension PaidApp {
    static let mockData: [PaidApp] = [
        PaidApp(icon: UIImage(resource: .essentialFin), ranking: "1", title: "위플 가계부 Pro", subtitle: "아이폰 사용자 수 1위 가계부", price: "₩14,000"),
        PaidApp(icon: UIImage(resource: .essentialCardPointers), ranking: "2", title: "편한가계부 (광고 제거)", subtitle: "국내 1위 가계부", price: "₩8,800"),
        PaidApp(icon: UIImage(resource: .essentialYNAB), ranking: "3", title: "멤버십 위젯 Pro", subtitle: "멤버십, 쿠폰, 포인트를 한번에 빠르게 할인/적립", price: "₩4,400"),
        PaidApp(icon: UIImage(resource: .essentialMoneyCoach), ranking: "4", title: "편한가계부 Classic (+PC 가계부)", subtitle: "금융", price: "₩8,800"),
        PaidApp(icon: UIImage(resource: .essentialSpendy), ranking: "5", title: "Binance Smart Chain Explorer", subtitle: "Track BSC Addresses", price: "₩4,400"),
        PaidApp(icon: UIImage(resource: .essentialSplitWise), ranking: "6", title: "보안카드 위젯", subtitle: "초스피드 계좌이체", price: "₩3,300"),
        PaidApp(icon: UIImage(resource: .essentialBuddy), ranking: "7", title: "BA Financial Calculator (PRO)", subtitle: "금융", price: "₩4,400"),
        PaidApp(icon: UIImage(resource: .essentialMarketWatch), ranking: "8", title: "코스트잇", subtitle: "알뜰살뜰 소비 메모장", price: "₩1,100"),
        PaidApp(icon: UIImage(resource: .essentialIFinance6), ranking: "9", title: "BA II Plus Financial", subtitle: "금융", price: "₩22,000"),
    ]
}
