//
//  UserToken.swift
//  SOPT
//
//  Created by 김송희 on 11/8/24.
//

import Foundation


struct LoginResponse: Decodable {
    let result: UserToken
}

struct UserToken: Decodable {
    let token: String
}
