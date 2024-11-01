//
//  EssentialAppModel.swift
//  SOPT
//
//  Created by 김송희 on 11/1/24.
//

import UIKit

struct EssentialApp: Hashable {
    let icon: UIImage
    let title: String
    let subtitle: String
}


extension EssentialApp {
    static let mockData: [EssentialApp] = [
        EssentialApp(icon: UIImage(resource: .essentialFin), title: "Fin - 가계부 및 예산 추적기", subtitle: "당신의 돈은 어디로 가고 있을까"),
        EssentialApp(icon: UIImage(resource: .essentialCardPointers), title: "CardPointers for Credit Cards", subtitle: "금융"),
        EssentialApp(icon: UIImage(resource: .essentialYNAB), title: "YNAB", subtitle: "금융"),
        EssentialApp(icon: UIImage(resource: .essentialMoneyCoach), title: "Money Coach Budget Manager Pro", subtitle: "Expense Tracker, Bill Planner"),
        EssentialApp(icon: UIImage(resource: .essentialSpendy), title: "Spendy - Spendings reimagined", subtitle: "금융"),
        EssentialApp(icon: UIImage(resource: .essentialSplitWise), title: "Splitwise", subtitle: "금융"),
        EssentialApp(icon: UIImage(resource: .essentialBuddy), title: "Buddy: Budget Planner App", subtitle: "금융"),
        EssentialApp(icon: UIImage(resource: .essentialMarketWatch), title: "MarketWatch - News & Data", subtitle: "금융"),
        EssentialApp(icon: UIImage(resource: .essentialIFinance6), title: "iFinance 5", subtitle: "금융"),
    ]
}
