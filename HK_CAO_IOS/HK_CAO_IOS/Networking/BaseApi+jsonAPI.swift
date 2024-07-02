//
// BaseApi+jsonAPI.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 26/06/2024.
//

import Foundation

extension ApiManager {
    // functionname: callJsonAPI
    // purpose: call api with json format (POST method)
    // params:
    // - api: api url (not include base url)
    // - parameter: parameter for api, must be [String: Any]
    // - isAuth: is need check token available and send if true, default is false
    // - block: callback after request, format: (dic, response, error)
    // - block.dic: response data in dictionary format
    // - block.response: response data in HTTPURLResponse format
    // - block.error: error if have
    // return: none
    static func callJsonAPI(
        api: String,
        parameter: [String: Any],
        isAuth: Bool = false,
        block: @escaping DRRequestHandler
    ) {
        let parameterData = parameter
        
        let url = "\(baseURL)\(api)"
        
        do {
            if var request = try createRequest(method: "POST", url: url, data: parameterData) {
                if isAuth {
                    guard let userInfo = Preferences.shared.userInfo else {
                        block(nil, nil, ApiError.tokenNotAvailable)
                        return
                    }
                    request.addValue("Bearer " + userInfo.accessToken, forHTTPHeaderField: accessTokenKey)
                }
                callHttpWithASync(request: request) { dicx, responsex, errorx in
                    block(dicx, responsex, errorx)
                }
            } else {
                block(nil, nil, ApiError.invalidParameters)
            }
        } catch {
            block(nil, nil, ApiError.unknowned)
        }
    }

    // functionname: callJsonAPIAnyParameter
    // purpose: call api with json format, parameter is any type (POST method)
    // params:
    // - api: api url (not include base url)
    // - parameter: parameter for api, not restrict type
    // - isAuth: is need check token available and send if true, default is false
    // - block: callback after request, format: (dic, response, error)
    // - block.dic: response data in dictionary format
    // - block.response: response data in HTTPURLResponse format
    // - block.error: error if have
    // return: none
    static func callJsonAPIAnyParameter(
        api: String,
        parameter: Any,
        isAuth: Bool = false,
        block: @escaping DRRequestHandler
    ) {
        let url = "\(baseURL)\(api)"
        
        do {
            if var request = try createRequest(method: "POST", url: url, anyParameter: parameter) {
                if isAuth {
                    guard let userInfo = Preferences.shared.userInfo else {
                        block(nil, nil, ApiError.tokenNotAvailable)
                        return
                    }
                    request.addValue("Bearer " + userInfo.accessToken, forHTTPHeaderField: accessTokenKey)
                }
                callHttpWithASync(request: request) { dicx, responsex, errorx in
                    block(dicx, responsex, errorx)
                }
            } else {
                block(nil, nil, ApiError.invalidParameters)
            }
        } catch {
            block(nil, nil, ApiError.unknowned)
        }
    }
    
    // functionname: callJsonAPIforPutMethod
    // purpose: call api with json format (PUT method)
    // params:
    // - api: api url (not include base url)
    // - parameter: parameter for api, must be [String: Any]
    // - isAuth: is need check token available and send if true, default is false
    // - block: callback after request, format: (dic, response, error)
    // - block.dic: response data in dictionary format
    // - block.response: response data in HTTPURLResponse format
    // - block.error: error if have
    // return: none
    static func callJsonAPIforPutMethod(
        api: String,
        parameter: [String: Any],
        isAuth: Bool = false,
        block: @escaping DRRequestHandler
    ) {
        let parameterData = parameter
        
        let url = "\(baseURL)\(api)"
        
        do {
            if var request = try createRequest(method: "PUT", url: url, data: parameterData) {
                if isAuth {
                    guard let userInfo = Preferences.shared.userInfo else {
                        block(nil, nil, ApiError.tokenNotAvailable)
                        return
                    }
                    request.addValue("Bearer " + userInfo.accessToken, forHTTPHeaderField: accessTokenKey)
                }
                callHttpWithASync(request: request) { dicx, responsex, errorx in
                    block(dicx, responsex, errorx)
                }
            } else {
                block(nil, nil, ApiError.invalidParameters)
            }
        } catch {
            block(nil, nil, ApiError.unknowned)
        }
    }
    
    // functionname: callJsonAPIforGetMethod
    // purpose: call api with json format (GET method)
    // params:
    // - api: api url (not include base url)
    // - parameter: parameter for api, must be String, this is path parameter
    // - isAuth: is need check token available and send if true, default is false
    // - block: callback after request, format: (dic, response, error)
    // - block.dic: response data in dictionary format
    // - block.response: response data in HTTPURLResponse format
    // - block.error: error if have
    // return: none
    static func callJsonAPIforGetMethod(
        api: String,
        parameter: String,
        isAuth: Bool = false,
        block: @escaping DRRequestHandler
    ) {
        let url = String(format: "\(baseURL)\(api)\(parameter)")
        PrintLog.log(message: "access: \(url) with: \(parameter)")
        
        if var request = createRequest(method: "GET", url: url) {
            if isAuth {
                guard let userInfo = Preferences.shared.userInfo else {
                    block(nil, nil, ApiError.tokenNotAvailable)
                    return
                }
                request.addValue("Bearer " + userInfo.accessToken, forHTTPHeaderField: accessTokenKey)
            }
            
            callHttpWithASync(request: request) { dicx, responsex, errorx in
                block(dicx, responsex, errorx)
            }
        } else {
            block(nil, nil, ApiError.invalidParameters)
        }
    }
    
    // functionname: callJsonAPIFullUrl
    // purpose: call api with json format, api is full url (POST method)
    // params:
    // - api: api url (not include base url, must be full url include http:// or https://)
    // - headers: header for api, must be [String: String]
    // - parameter: parameter for api, must be [String: Any]
    // - block: callback after request, format: (dic, response, error)
    // - block.dic: response data in dictionary format
    // - block.response: response data in HTTPURLResponse format
    // - block.error: error if have
    // return: none
    static func callJsonAPIFullUrl(
        api: String,
        headers: [String: String]?,
        parameter: [String: Any],
        block: @escaping DRRequestHandler
    ) {
        do {
            if let request = try createRequest(method: "POST", url: api, headers: headers, data: parameter) {
                callHttpWithASync(request: request) { dicx, responsex, errorx in
                    block(dicx, responsex, errorx)
                }
            } else {
                block(nil, nil, ApiError.invalidParameters)
            }
        } catch {
            block(nil, nil, ApiError.unknowned)
        }
    }
}
