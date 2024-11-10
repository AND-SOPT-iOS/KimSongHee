//
//  SignUpService.swift
//  SOPT
//
//  Created by 김송희 on 11/6/24.
//

import Foundation
import Alamofire

class SignUpService {
    
    func register(
        username: String,
        password: String,
        hobby: String,
        completion: @escaping (Result<Bool, NetworkError>) -> Void
    ) {
        
        let url = Environment.baseURL + "/user"
        
        let parameters = SignUpRequest(
            username: username,
            password: password,
            hobby: hobby
        )
        
        AF.request(
            url,
            method: .post,
            parameters: parameters,
            encoder: JSONParameterEncoder.default
        )
        .validate()
        .response { response in

            guard let statusCode = response.response?.statusCode,
                  let data = response.data
            else {
                completion(.failure(.unknownError))
                return
            }
            
            switch response.result {
            case .success:
                completion(.success(true))
                
            case .failure:
                let error = SignUpErrorHandler.handleStatusCode(statusCode, data: data)
                completion(.failure(error))
            }
        }
    }
}
