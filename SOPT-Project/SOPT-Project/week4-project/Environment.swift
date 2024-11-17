//
//  Environment.swift
//  SOPT
//
//  Created by 김송희 on 11/6/24.
//

import Foundation

enum Environment {
  static let baseURL: String = Bundle.main.infoDictionary?["BASE_URL"] as! String
}
