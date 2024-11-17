//
//  LoginRequest.swift
//  SOPT
//
//  Created by 김송희 on 11/8/24.
//

import Foundation

struct LoginRequest: Codable {
    let userName: String
    let password: String

    enum CodingKeys: String, CodingKey {
        case userName = "username"
        case password
    }
}
