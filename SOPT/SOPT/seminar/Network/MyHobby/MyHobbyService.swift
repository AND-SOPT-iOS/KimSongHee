//
//  MyHobbyService.swift
//  SOPT
//
//  Created by 김송희 on 11/8/24.
//

import Foundation
import Alamofire

class MyHobbyService {
    
    func myHobby(
    token: String,
    completion: @escaping (Result<String, NetworkError>) -> Void
    ) {
        // 토큰 꺼내오기
        guard let token = UserDefaults.standard.string(forKey: "authToken")
        else {return}
        
        let url = Environment.baseURL + "/user/my-hobby"
        let headers: HTTPHeaders = ["token": token]
        
        AF.request(
            url,
            method: .get,
            headers: headers
        )
        .validate()
        .responseData { [weak self] response in
           // Type of expression is ambiguous without a type annotation 에러 발생
            
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
        return errorResponse.code //00 혹은 01
    }
}
