//
//  UserService.swift
//  SOPT
//
//  Created by 김송희 on 11/6/24.
//

import Foundation
import Alamofire

/// 클래스는 라우터 별로 나눠줄 수 있으며, 이 클래스의 라우터는 /user
class UserService {
    
    /// 등록 메소드로, Request Body에 필요한 것들을 파라미터로 받음
    func register(
        username: String,
        password: String,
        hobby: String,
        completion: @escaping (Result<Bool, NetworkError>) -> Void
    ) {
        
        let url = Environment.baseURL + "/user"
        
        /// HTTP 요청에서 전송되는 데이터를 "parameters" 또는 "params"라고 부름
        let parameters = RegisterRequest(
            username: username,
            password: password,
            hobby: hobby
        )
        
        /// Alamofire를 사용하여 Request
        AF.request(
            url,
            method: .post,
            parameters: parameters,
            encoder: JSONParameterEncoder.default
        )
        .validate() // 유효성 검사, 200번대인지 확인
        .response { [weak self] response in
            /// self를 사용한 이유: 클래스 내의 다른 함수에 접근해야 하고, response가 escaping closure이기 때문

            /// status code 받아옴
            guard let statusCode = response.response?.statusCode,
                  let data = response.data,
                  let self
            else {
                completion(.failure(.unknownError))
                return
            }
            
            /// Alamofire의 data response에는 result 프로퍼티가 존재하며, 해당 프로퍼티는 Result<Success, Failure> 타입
            /// Result<Bool, NetworkError>로 사용하면 Success 시 Bool 값을, Failure 시 NetworkError를 리턴하겠다는 뜻
            switch response.result {
            /// Success 시 Bool 값 리턴
            case .success:
                completion(.success(true))
                
            /// Failure 시 NetworkError 리턴
            case .failure:
                let error = self.handleStatusCode(statusCode, data: data)
                completion(.failure(error))
            }
        }
    }
    
    /// 서버의 명세서 기반으로 에러 처리 진행
    func handleStatusCode(
        _ statusCode: Int,
        data: Data
    ) -> NetworkError {
        let errorCode = decodeError(data: data)
        switch (statusCode, errorCode) {
        case (400, "00"):
            return .invalidRequest
        case (400, "01"):
            return .expressionError
        case (404, ""):
            return .invalidURL
        case (409, "00"):
            return .duplicateError
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
