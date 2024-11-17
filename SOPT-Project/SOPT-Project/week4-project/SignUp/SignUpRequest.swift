//
//  SignUpRequest.swift
//  SOPT
//
//  Created by 김송희 on 11/6/24.
//

import Foundation

/// 서버의 제약조건: 각 프로퍼티는 8자 이하여야 함
struct SignUpRequest: Codable {
    let userName: String
    let password: String
    let hobby: String
    
    enum CodingKeys: String, CodingKey {
        case userName = "username"
        case password
        case hobby
    }
}
