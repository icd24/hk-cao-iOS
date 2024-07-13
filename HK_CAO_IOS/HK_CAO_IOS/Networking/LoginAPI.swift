//
//  LoginApi.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 26/06/2024.
//

import Foundation
import SwiftUI

class LoginApi {
    static private let loginUrl = "/api/login"
    static func login(username: String, password: String, completionHandler: @escaping (Result<LoginResponseModel, ApiError>) -> Void) {
        do {
            let parameters: LoginRequestModel = LoginRequestModel(
                username: username,
                password: password,
                deviceToken: AppState.shared.deviceToken
            )
            
            let encoder = JSONEncoder()
            let requestData = try encoder.encode(parameters)
            
            ApiManager.post(url: loginUrl, data: requestData, completion: { result in
                switch result {
                case .success(let data):
                    do {
                        let decoder = JSONDecoder()
                        let response = try decoder.decode(LoginResponseModel.self, from: data)
                        completionHandler(.success(response))
                    } catch {
                        completionHandler(.failure(.decodingError))
                    }
                case .failure(let error):
                    completionHandler(.failure(error))
                }
            })
        } catch {
            completionHandler(.failure(.invalidParameters))
        }
    }
}
