//
//  NetworkErrorHandler.swift
//  SOPT
//
//  Created by 김송희 on 11/11/24.
//

import Foundation

import Foundation

class NetworkErrorHandler {
    
    static func handleStatusCode(
        _ statusCode: Int,
        data: Data
    ) -> NetworkError {
        let errorCode = decodeError(data: data)
        switch (statusCode, errorCode) {
        case (400, "00"):
            return .expressionError
        case (400, "01"):
            return .invalidRequest
        case (400, "02"), (403, "01"):
            return .invalidPassword
        case (404, "00"):
            return .invalidURL
        case (401, "00"):
            return .noToken
        case (403, "00"):
            return .invalidToken
        case (404, "01"):
            return .noNo
        case (500, ""):
            return .serverError
        default:
            return .unknownError
        }
    }
    
    static func decodeError(data: Data) -> String {
        guard let errorResponse = try? JSONDecoder().decode(
            ErrorResponse.self,
            from: data
        ) else { return "" }
        return errorResponse.code
    }
}

class SignUpErrorHandler {
    static func handleStatusCode(_ statusCode: Int, data: Data) -> NetworkError {
        let errorCode = decodeError(data: data)
        switch (statusCode, errorCode) {
        case (400, "00"):
            return .invalidRequest
        case (400, "01"):
            return .expressionError
        case (409, "00"):
            return .duplicateError
        case (404, ""):
            return .invalidURL
        default:
            return NetworkErrorHandler.handleStatusCode(statusCode, data: data)
        }
    }
    
    static func decodeError(data: Data) -> String {
        return NetworkErrorHandler.decodeError(data: data)
    }
}
