//
//  NetworkError.swift
//  SOPT
//
//  Created by 김송희 on 11/6/24.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case invalidRequest
    case decodingError
    case networkError(Error)
    case serverError
    case unknownError
    case duplicateError
    case expressionError
    case invalidPassword
    case failureToken
    case noToken
    case invalidToken
    case noNo
    case strange
    
    var errorMessage: String {
        switch self {
        case .invalidURL:
            return "잘못된 URL입니다"
        case .invalidResponse:
            return "잘못된 응답입니다"
        case .invalidRequest:
            return "잘못된 요청입니다."
        case .decodingError:
            return "데이터 디코딩 실패"
        case .networkError(let error):
            return "네트워크 오류: \(error.localizedDescription)"
        case .serverError:
            return "서버 오류입니다."
        case .unknownError:
            return "알 수 없는 오류가 발생했습니다"
        case .duplicateError:
            return "중복 에러입니다"
        case .expressionError:
            return "표현식 오류입니다"
        case .invalidPassword:
            return "잘못된 비밀번호입니다"
        case .failureToken:
            return "토큰 저장 실패"
        case .noToken:
            return "header에 토큰이 없습니다"
        case .invalidToken:
            return "유효하지 않은 토큰입니다"
        case .noNo:
            return "해당되는 번호가 없습니다"
        case .strange:
            return "이상한 에러가 발생했어요"
        }
    }
}

struct ErrorResponse: Decodable {
    let code: String
}

