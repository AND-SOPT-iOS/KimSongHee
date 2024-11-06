//
//  RegisterRequest.swift
//  SOPT
//
//  Created by 김송희 on 11/6/24.
//

import Foundation

/// 서버의 명세서에 맞추어 구조체 생성
/// 서버의 제약조건: 각 프로퍼티는 8자 이하여야 함
struct RegisterRequest: Codable {
  let username: String
  let password: String
  let hobby: String
}
