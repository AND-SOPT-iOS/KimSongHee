//
//  EditService.swift
//  SOPT
//
//  Created by 김송희 on 11/8/24.
//

import Foundation
import Alamofire

class EditService {
    
    func edit(
        token: String,
        hobby: String,
        password: String,
        completion: @escaping (Result<Bool, NetworkError>) -> Void
    ) {
        
        let url = Environment.baseURL + "/user"
        let headers: HTTPHeaders = ["token": token]
        
        let parameters = EditRequest(
            hobby: hobby,
            password: password
        )
        
        AF.request(
            url,
            method: .put,
            parameters: parameters,
            encoder: JSONParameterEncoder.default,
            headers: headers
        )
        .validate()
        .response { [weak self] response in
            
            guard let statusCode = response.response?.statusCode,
                  let self
            else {
                completion(.failure(.unknownError))
                return
            }
            
            if 200...299 ~= statusCode {
                completion(.success(true))
            } else {
                if let data = response.data {
                    let error = self.handleStatusCode(statusCode, data: data)
                    completion(.failure(error))
                } else {
                    completion(.failure(.unknownError))
                }
            }
        }
    }
    
    func handleStatusCode(
        _ statusCode: Int,
        data: Data
    ) -> NetworkError {
        let errorCode = decodeError(data: data)
        switch (statusCode, errorCode) {
        case (400, "00"):
            return .expressionError
        case (401, "00"):
            return .noToken
        case (403, "00"):
            return .invalidToken
        case (404, "00"):
            return .invalidURL
        case (500, ""):
            return .serverError
        default:
            return .unknownError
        }
    }
    
    func decodeError(data: Data) -> String {
        guard let errorResponse = try? JSONDecoder().decode(
            ErrorResponse.self,
            from: data
        ) else { return "" }
        return errorResponse.code
    }
}
