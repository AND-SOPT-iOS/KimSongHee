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
        .response { response in
            
            guard let statusCode = response.response?.statusCode
            else {
                completion(.failure(.unknownError))
                return
            }
            
            if 200...299 ~= statusCode {
                completion(.success(true))
            } else {
                if let data = response.data {
                    let error = NetworkErrorHandler.handleStatusCode(statusCode, data: data)
                    completion(.failure(error))
                } else {
                    completion(.failure(.unknownError))
                }
            }
        }
    }
}
