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
                  let data = response.data,
                  let self
            else {
                completion(.failure(.strange))
                // 왜 입력받은 취미가 서버에서는 제대로 바뀌는데 이 else 문에 걸릴까?
                // 서버에서 빈 response를 반환하고 있어서 data가 nil이 됨
                return
            }
            
            switch response.result {
            case .success:
                completion(.success(true))
                
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
