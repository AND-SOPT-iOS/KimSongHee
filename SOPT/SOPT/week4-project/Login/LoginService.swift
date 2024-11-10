//
//  LoginService.swift
//  SOPT
//
//  Created by 김송희 on 11/8/24.
//

import Foundation
import Alamofire

class LoginService {
    
    func login(
        username: String,
        password: String,
        completion: @escaping (Result<Bool, NetworkError>) -> Void
    ) {
        
        /// baseURL + /user = http://211.188.53.75:8080/login
        let url = Environment.baseURL + "/login"
        
        let parameters = LoginRequest(
            username: username,
            password: password
        )
        
        AF.request(
            url,
            method: .post,
            parameters: parameters,
            encoder: JSONParameterEncoder.default
        )
        .validate()
        .response { [weak self] response in
            
            guard let statusCode = response.response?.statusCode,
                  let data = response.data,
                  let self
            else {
                completion(.failure(.unknownError))
                return
            }
            
            switch response.result {
            case .success:
                
                do {
                    let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
                    UserDefaults.standard.set(loginResponse.result.token, forKey: "authToken")
                    completion(.success(true))
                    
                } catch {
                    completion(.failure(.failureToken))
                }
                
                case .failure:
                let error = self.handleStatusCode(statusCode, data: data)
                completion(.failure(error))
            }
        }
    }
    
    func handleStatusCode(
        _ statusCode: Int,
        data: Data
    ) -> NetworkError {
        let errorCode = decodeError(data: data)
        switch (statusCode, errorCode) {
        case (400, "01"):
            return .invalidRequest
        case (400, "02"):
            return .invalidPassword
        case (403, "01"):
            return .invalidPassword
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
