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
        hobby: String,
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
            
            /// public let result: Result<Success, Failure>
            /// Alamofire의 data response에는 result 프로퍼티가 존재하는데, 해당 프로퍼티는 Result<Success, Failure> 타입임!
            /// 이 말은, 타입이 다른 함수에서 리턴되어 넘어갈 때, success로 넘어갈 수 있고 failure로 넘어갈 수 있다는 것
            /// 그리고 그 안에는 우리가 원하는 결과값들이 존재한다.
            /// Result<Bool, NetworkError>
            /// Success 하면 Bool 값을, Failure 하면 NetworkError를 리턴하겠다는 뜻
            /// Success에는 원하는 타입이 올 수 있고, Failure에는 Error 프로토콜이 채택된 것이 리턴될 수 있도록 되어야 함
            switch response.result {
            case .success:
                /// 네트워크 요청이 성공적으로 진행되었을 때, escaping closure을 실행하고 bool값을 success로 넘김.
                
                // 토큰 받아오기
                do {
                    // JSON 데이터를 LoginResponse 타입으로 디코딩
                    let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
                    
                    // 디코딩된 토큰 값을 UserDefaults에 저장
                    UserDefaults.standard.set(loginResponse.result.token, forKey: "authToken")
                                        
                    // 성공적으로 디코딩하고 토큰을 저장한 후에 completion 호출
                    completion(.success(true))
                    
                } catch {
                    completion(.failure(.failureToken))
                }
                
                case .failure:
                /// 네트워크 요청이 실패했을 때, 어떤 이유인지 파악하여 escaping closure을 실행하고 파악된 error를 넘김
                let error = self.handleStatusCode(statusCode, data: data)
                completion(.failure(error))
            }
        }
    }
    
    /// 서버의 명세서 기반으로 에러 처리를 진행해줌
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
        return errorResponse.code //00 혹은 01
    }
}
