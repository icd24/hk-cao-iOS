//
//  BaseApi.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 26/06/2024.
//

import Foundation

typealias DRRequestHandler = (Result<Data, ApiError>) -> Void

struct ApiManager {
    static let baseURL = Bundle.main.baseURL
    static let accessTokenKey = "Authorization"
}

// MARK: Extension for create request:
extension ApiManager {
    static func createRequest(method: HTTPMethod, url: String, data: Data? = nil, queryData: [URLQueryItem]? = nil, headers: [String: String]? = nil) throws -> URLRequest? {
        if !NetworkUtility.shared.isNetworkAvailable() {
            throw ApiError.networkUnavailable
        }
        
        let finalUrl = baseURL + url
        var components = URLComponents(url: URL(string: finalUrl)!, resolvingAgainstBaseURL: true)
        if let queryData = queryData {
            components?.queryItems = queryData
        }
        
        guard let url = components?.url else {
            throw ApiError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        // TODO: get and add access token
        //            request.setValue("Bearer YOUR_ACCESS_TOKEN", forHTTPHeaderField: accessTokenKey)
        
        if let headers = headers {
            for (key, value) in headers {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        if let data = data {
            request.httpBody = data
        }
        
        return request
    }
}

// MARK: Extension for each method
extension ApiManager {
    static func post(url: String, data: Data? = nil, headers: [String: String]? = nil, completion: @escaping (Result<Data, ApiError>) -> Void) {
        performDataTask(method: .POST, url: url, data: data, headers: headers, completion: completion)
    }
    
    static func get(url: String, queryData: [URLQueryItem]? = nil, headers: [String: String]? = nil, completion: @escaping (Result<Data, ApiError>) -> Void) {
        performDataTask(method: .GET, url: url, queryData: queryData, headers: headers, completion: completion)
    }
    
    static func put(url: String, data: Data? = nil, headers: [String: String]? = nil, completion: @escaping (Result<Data, ApiError>) -> Void) {
        performDataTask(method: .PUT, url: url, data: data, headers: headers, completion: completion)
    }
    
    private static func performDataTask(method: HTTPMethod, url: String, data: Data? = nil, queryData: [URLQueryItem]? = nil, headers: [String: String]? = nil, completion: @escaping (Result<Data, ApiError>) -> Void) {
        
        do {
            guard let request = try createRequest(method: method, url: url, data: data, queryData: queryData, headers: headers) else {
                completion(.failure(.invalidParameters))
                return
            }
            
            DispatchQueue.global().async {
                URLSession.shared.dataTask(with: request) { data, response, error in
                    if let error = error {
                        DispatchQueue.main.async {
                            completion(.failure(.invalidResponse))
                        }
                        return
                    }
                    
                    guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                        DispatchQueue.main.async {
                            completion(.failure(.invalidResponse))
                        }
                        return
                    }
                    
                    guard let data = data else {
                        DispatchQueue.main.async {
                            completion(.failure(.noData))
                        }
                        return
                    }
                    
                    DispatchQueue.main.async {
                        completion(.success(data))
                    }
                }.resume()
            }
        } catch let error as ApiError {
            DispatchQueue.main.async {
                completion(.failure(error))
            }
        } catch {
            DispatchQueue.main.async {
                completion(.failure(.invalidURL))
            }
        }
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
    case decodingError
    case unknowned
    
    // TODO: Dev only
    case notImplement
}

enum HTTPMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
}
