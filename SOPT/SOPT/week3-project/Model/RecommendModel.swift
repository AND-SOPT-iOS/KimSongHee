//
//  RecommendModel.swift
//  SOPT
//
//  Created by 김송희 on 10/31/24.
//

import UIKit

struct Recommend: Hashable {
    let image: UIImage
    let category: String
    let title: String
    let subtitle: String
}


extension Recommend {
    static let mockData: [Recommend] = [
        Recommend(image: UIImage(resource: .recommendTaxnote), category: "추천", title: "Taxnote 부기 및 회계 앱", subtitle: "간편한 장부 관리"),
        Recommend(image: UIImage(resource: .recommendFortuneCity), category: "새로운 경험", title: "Fortune City - A Finance App", subtitle: "게임을 하듯 관리하는 가계부"),
        Recommend(image: UIImage(resource: .recommendCurrenzy), category: "추천", title: "Currenzy", subtitle: "빠르고 쉬운 환율 계산"),
        Recommend(image: UIImage(resource: .recommendElk), category: "새로운 앱", title: "Elk - 여행 환율 변환기", subtitle: "언제 어디서나 간편한 환율 체크"),
    ]
}
