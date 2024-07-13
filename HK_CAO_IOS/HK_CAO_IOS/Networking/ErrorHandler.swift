//
//  ErrorHandler.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 26/06/2024.
//

import SwiftUI

class ErrorHandler {
    static let handler = ErrorHandler()
    static let successCode = "200"
    static let refreshTokenCode = "401"
    static let refreshTokenCodeList = ["E40101", "E40103", "E40104", "E40105"]
    
    func handleApiError(
        error: ApiError?,
        dict: [String: Any]?,
        isRetry: Bool = false,
        defaultMessage: String? = nil,
        isDefaultPriority: Bool = false,
        callbackFunction: (() -> Void)? = nil
    ) {
        if error != nil {
            handleError(
                error: error,
                dict: dict,
                isRetry: isRetry,
                defaultMessage: defaultMessage,
                isDefaultPriority: isDefaultPriority,
                callbackFunction: callbackFunction
            )
        } else if let status: String = dict?["status_code"] as? String, status != ErrorHandler.successCode {
            handleStatusCode(
                status: status,
                defaultMessage: defaultMessage,
                responseMessage: dict?["message"] as? String,
                errorCode: dict?["error_code"] as? String,
                callbackFunction: callbackFunction
            )
        }
    }
    
    func handleError(
        error: ApiError?,
        dict: [String: Any]?,
        isRetry: Bool = false,
        defaultMessage: String? = nil,
        isDefaultPriority: Bool = false,
        callbackFunction: (() -> Void)? = nil
    ) {
        switch error {
        case .networkUnavailable:
            break
        case .httpError(_):
            break
        case .tokenNotAvailable:
            break
        default:
            return
        }
    }
    
    func handleStatusCode(
        status: String,
        defaultMessage: String? = nil,
        responseMessage: String? = nil,
        errorCode: String? = nil,
        callbackFunction: (() -> Void)? = nil
    ) {
        switch status {
        case ErrorHandler.refreshTokenCode:
            if errorCode != nil && ErrorHandler.refreshTokenCodeList.contains(errorCode!) {
                handleRefreshToken(callbackFunction: callbackFunction)
            } else {
                showAlertWithDefault(defaultMessage: defaultMessage, responseMessage: responseMessage)
            }
        default:
            showAlertWithDefault(defaultMessage: defaultMessage, responseMessage: responseMessage)
            return
        }
    }
    
    func showAlertWithDefault(
        defaultMessage: String? = nil,
        responseMessage: String? = nil
    ) {
        var message = AppString.errorDefault
        if defaultMessage != nil {
            message = defaultMessage!
        } else if responseMessage != nil {
            message = responseMessage!
        }
        
        AppState.showAlert(
            title: message
        )
    }
    
    func handleRefreshToken(
        callbackFunction: (() -> Void)? = nil
    ) {
        // TODO: Implement later
//        if callbackFunction != nil {
//            RefreshTokenApi.refreshToken { dict2, _, error2 in
//                guard let status2: String = dict2?["status_code"] as? String,
//                      status2 == ErrorHandler.successCode,
//                      let data: String = dict2?["data"] as? String,
//                      error2 == nil else {
//                    let message = AppString.errorDefault
//                    Preferences.shared.userInfo = nil
//                    AppState.showAlert(
//                        title: message,
//                        onOk: {
//                            AppState.shared.logoutAction()
//                        }
//                    )
//                    return
//                }
//                
//                do {
//                    let userInfo = try JSONDecoder().decode(UserInfo.self, from: data.data(using: .utf8)!)
//                    Preferences.shared.userInfo = userInfo
//                    callbackFunction!()
//                } catch {
//                    let message = AppString.errorDefault
//                    Preferences.shared.userInfo = nil
//                    AppState.showAlert(
//                        title: message,
//                        onOk: {
//                            AppState.shared.logoutAction()
//                        }
//                    )
//                    return
//                }
//                
//            }
//        } else {
//            AppState.shared.logoutAction()
//        }
    }
}
