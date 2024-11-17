//
//  HobbyResult.swift
//  SOPT
//
//  Created by 김송희 on 11/8/24.
//

import Foundation

struct HobbyResponse: Decodable {
    let result: HobbyResult
}

struct HobbyResult: Decodable {
    let hobby: String
}
