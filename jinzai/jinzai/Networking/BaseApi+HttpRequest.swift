//
// BaseApi+HttpRequest.swift
//  jinzai
//
//  Created by HieuNV on 26/06/2024.
//

import Foundation

extension ApiManager {
    // functionname: callHttpWithASync
    // purpose: call http request with asynchronous
    // params:
    // - request: URLRequest
    // - completionHandler: callback after request, format: (dic, response, error)
    // - completionHandler.dic: response data in dictionary format
    // - completionHandler.response: response data in HTTPURLResponse format
    // - completionHandler.error: error if have
    // return: none
    static func callHttpWithASync(request: URLRequest, completionHandler: @escaping DRRequestHandler) {
        if !NetworkUtility.shared.isNetworkAvailable() {
            let error = ApiError.networkUnavailable
            completionHandler(nil, nil, error)
            return
        }
        
        DispatchQueue.global(qos: .default).async {
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    DispatchQueue.main.async {
                        self.showInfo(data: data, response: response, error: error)
                        let json = self.json(data: data, response: response)
                        completionHandler(json, response, ApiError.networkError(error))
                    }
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    DispatchQueue.main.async {
                        self.showInfo(data: data, response: response, error: error)
                        let json = self.json(data: data, response: response)
                        completionHandler(json, response, ApiError.invalidResponse)
                    }
                    return
                }
                
                guard (200..<300).contains(httpResponse.statusCode) else {
                    DispatchQueue.main.async {
                        self.showInfo(data: data, response: response, error: error)
                        let json = self.json(data: data, response: response)
                        completionHandler(json, response, ApiError.httpError(httpResponse.statusCode))
                    }
                    return
                }
                
                guard let data = data else {
                    DispatchQueue.main.async {
                        self.showInfo(data: data, response: response, error: error)
                        let json = self.json(data: data, response: response)
                        completionHandler(json, response, ApiError.noData)
                    }
                    return
                }
                
                DispatchQueue.main.async {
                    self.showInfo(data: data, response: response, error: error)
                    let json = self.json(data: data, response: response)
                    completionHandler(json, response, nil)
                }
            }.resume()
        }
    }
    
    // functionname: callHttpWithSync
    // purpose: call http request with synchronous
    // params:
    // - request: URLRequest
    // - completionHandler: callback after request, format: (dic, response, error)
    // - completionHandler.dic: response data in dictionary format
    // - completionHandler.response: response data in HTTPURLResponse format
    // - completionHandler.error: error if have
    // return: true if success, false if fail
    static func callHttpWithSync(request: URLRequest, completionHandler: @escaping DRRequestHandler) -> Bool {
        if !NetworkUtility.shared.isNetworkAvailable() {
            let error = ApiError.networkUnavailable
            completionHandler(nil, nil, error)
            return false
        }
        
        var response: URLResponse?
        var error: Error?
        let semaphore = DispatchSemaphore(value: 0)
        
        URLSession.shared.dataTask(with: request) { (data, res, err) in
            response = res
            error = err
            self.showInfo(data: data, response: res, error: err)
            completionHandler(
                self.json(data: data, response: res),
                res,
                (err != nil) ? ApiError.networkError(err!) : nil
            )
            semaphore.signal()
        }.resume()
        
        semaphore.wait()
        return (response != nil && error == nil)
    }
}
