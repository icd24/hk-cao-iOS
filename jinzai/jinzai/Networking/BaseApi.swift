//
//  BaseApi.swift
//  jinzai
//
//  Created by HieuNV on 26/06/2024.
//

import Foundation

typealias DRRequestHandler = ([String: Any]?, URLResponse?, ApiError?) -> Void

class ApiManager {
    static let shared = ApiManager()
    
#if PRODUCTION
    static let baseURL = "https://api.smakye.com/api"
    static let clientSecret = "jqUvsB3eRw7HlP6HKHPiAHwGwn"
#elseif DEV
    static let baseURL = "https://dev-api.smakye.com/api"
    static let clientSecret = "g6mxMe1CFDod3A0NTlwbt"
#elseif STAGING
    static let baseURL = "https://stg-api.smakye.com/api"
    static let clientSecret = "n8CZICSrTsGrwTsSpkmHCsFnO"
#else
    static let baseURL = "https://dev-api.smakye.com/api"
    static let clientSecret = "g6mxMe1CFDod3A0NTlwbt"
#endif
    
    static let clientSecretKey = "client-secret"
    static let accessTokenKey = "Authorization"
    
    private init() {}
    
    static func buildParameters(params: [String: Any]) -> String {
        var queryString = ""
        
        for (key, value) in params {
            var uriEncodedValue = "\(value)"
            if let numberValue = value as? NSNumber {
                uriEncodedValue = numberValue.stringValue
            } else if let dateValue = value as? Date {
                do {
                    uriEncodedValue = try convertDateParam(date: dateValue)
                } catch {
                    uriEncodedValue = ""
                }
            }
            if let encodedValue = uriEncodedValue.addingPercentEncoding(withAllowedCharacters: .alphanumerics) {
                queryString.append("\(key)=\(encodedValue)&")
            }
        }
        
        if queryString.count > 0 {
            queryString.removeLast()
        }
        
        return queryString
    }
    
    static func json(data: Data?, response: URLResponse?) -> [String: Any]? {
        guard let data = data, let httpResponse = response as? HTTPURLResponse else {
            return nil
        }
        
        var json: [String: Any]?
        let headerInfo = httpResponse.allHeaderFields
        
        for (key, obj) in headerInfo {
            if let value = obj as? String, key as? String == "Content-Type" {
                let range = value.lowercased().range(of: "application/json")
                if range != nil {
                    do {
                        json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
                        
                        if json != nil {
                            var xdic = json!
                            if let errorValue = json!["error"], errorValue is NSNull {
                                xdic.removeValue(forKey: "error")
                            }
                            
                            if let value = json!["result"] {
                                if let arrayValue = value as? [Any] {
                                    xdic["result"] = removeNull(list: arrayValue)
                                } else if value is NSNull {
                                    xdic["result"] = [] as [Any]
                                }
                                
                                json = xdic
                            }
                        }
                    } catch {
                        json = nil
                    }
                }
            }
        }
        
        return json
    }
    
    static func removeNull(list: [Any]) -> [Any] {
        var mlist = [Any]()
        
        for item in list {
            if let dict = item as? [String: Any] {
                var mdic = [String: Any]()
                
                for (key, value) in dict where value is NSNull == false {
                    if let arrayValue = value as? [Any] {
                        mdic[key] = removeNull(list: arrayValue)
                    } else {
                        mdic[key] = value
                    }
                }
                
                mlist.append(mdic)
            } else {
                mlist.append(item)
            }
        }
        
        return mlist
    }
    
    static func showInfo(data: Data?, response: URLResponse?, error: Error?) {
        var message = ""
        if let httpResponse = response as? HTTPURLResponse {
            message = "[RESULTS]\r\nstatus: \(httpResponse.statusCode)\r\n[HEADER]\r\n"
            
            for (key, obj) in httpResponse.allHeaderFields {
                message.append("\(key): \(obj)\r\n")
            }
        }
        
        PrintLog.log(message: message)
        message = ""
        
        if let data = data, let jsonString = String(data: data, encoding: .utf8) {
            message = "[JSON]\r\n\(jsonString)"
        } else {
            message = "[Data]\r\n\(String(data: data ?? Data(), encoding: .utf8) ?? "")"
        }
        
        PrintLog.log(message: message)
    }
}

// MARK: extention for convert params
extension ApiManager {
    static func convertParams(parameters: [String: Any]?) throws -> [String: Any] {
        var encodedParameters = [String: Any]()
        
        if parameters != nil {
            for (key, value) in parameters! {
                if let date = value as? Date {
                    encodedParameters[key] = try convertDateParam(date: date)
                } else {
                    encodedParameters[key] = value
                }
            }
        }
        
        return encodedParameters
    }
    
    static func convertDateParam(date: Date) throws -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
}

// MARK: Extension for create request:
extension ApiManager {
    static func createRequest(method: String, url: String, data: [String: Any]?) throws -> URLRequest? {
        var mdic = data ?? [:]
        
        mdic = try convertParams(parameters: mdic)
        
        guard JSONSerialization.isValidJSONObject(mdic) else {
            return nil
        }
        
        let requestData = try JSONSerialization.data(withJSONObject: mdic, options: .prettyPrinted)
        
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = method
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("\(requestData.count)", forHTTPHeaderField: "Content-Length")
        request.addValue(clientSecret, forHTTPHeaderField: clientSecretKey)
        request.httpBody = requestData
        
        return request
    }

    static func createRequest(method: String, url: String, anyParameter: Any?) throws -> URLRequest? {
        guard let data = anyParameter else {
            return nil
        }
        
        guard JSONSerialization.isValidJSONObject(data) else {
            return nil
        }
        
        let requestData = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
        
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = method
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("\(requestData.count)", forHTTPHeaderField: "Content-Length")
        request.addValue(clientSecret, forHTTPHeaderField: clientSecretKey)
        request.httpBody = requestData
        
        return request
    }
    
    static func createRequest(
        method: String,
        url: String,
        headers: [String: String]?,
        data: [String: Any]?
    ) throws -> URLRequest? {
        var request = try createRequest(method: method, url: url, data: data)
        
        let mHeaders = headers ?? [:]
        for (key, value) in mHeaders {
            request?.setValue(value, forHTTPHeaderField: key)
        }
        
        return request
    }
    
    static func createRequest(method: String, url: String) -> URLRequest? {
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = method
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(clientSecret, forHTTPHeaderField: clientSecretKey)
        
        return request
    }
}

enum ApiError: Error {
    case invalidURL
    case invalidParameters
    case networkError(Error)
    case invalidResponse
    case networkUnavailable
    case tokenNotAvailable
    case httpError(Int)
    case noData
    case unknowned
}
