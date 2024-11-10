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
        .responseData { response in
            
            guard let statusCode = response.response?.statusCode,
                  let data = response.data
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
                    let error = NetworkErrorHandler.handleStatusCode(statusCode, data: data)
                    completion(.failure(error))
                }
                
            case .failure:
                let error = NetworkErrorHandler.handleStatusCode(statusCode, data: data)
                completion(.failure(error))
            }
        }
    }
}
