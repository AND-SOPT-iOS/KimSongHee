//
//  HisHobbyService.swift
//  SOPT
//
//  Created by 김송희 on 11/8/24.
//

import Foundation
import Alamofire

class HisHobbyService {
    
    func hisHobby(
        token: String,
        no: String,
        completion: @escaping (Result<String, NetworkError>) -> Void
    ) {
        
        let url = Environment.baseURL + "/user/" + no + "/hobby"
        let headers: HTTPHeaders = ["token": token]
        
        AF.request(
            url,
            method: .get,
            headers: headers
        )
        .validate()
        .responseData { [weak self] response in
            
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
                    let hobbyResponse = try JSONDecoder().decode(HobbyResponse.self, from: data)
                    let hobby = hobbyResponse.result.hobby
                    completion(.success(hobby))
                } catch {
                    let error = self.handleStatusCode(statusCode, data: data)
                    completion(.failure(error))
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
        case (404, "00"):
            return .invalidURL
        case (404, "01"):
            return .noNo
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
        return errorResponse.code //00 혹은 01
    }
}
