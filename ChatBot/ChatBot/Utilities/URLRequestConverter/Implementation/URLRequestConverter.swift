//
//  URLRequestConverter.swift
//  ChatBot
//
//  Created by BOMBSGIE on 2024/01/08.
//

import Foundation

struct URLRequestConverter: URLRequestConvertible {
    private let baseURL: String
    private let headerFields: [String : String]?
    private let httpMethod: HTTPMethod
    private let bodyDTO: Encodable?
    
    init(apiRequest: APIRequestable) {
        self.baseURL = apiRequest.baseURL
        self.headerFields = apiRequest.headerFields
        self.httpMethod = apiRequest.httpMethod
        self.bodyDTO = apiRequest.bodyDTO
    }
    
    func asURLRequest(with encoder: JSONEncodable) throws -> URLRequest {
        guard let url = URL(string: baseURL)
        else {
            throw NetworkError.badURL
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.allHTTPHeaderFields = headerFields
        urlRequest.httpMethod = "\(httpMethod)"
        guard let bodyDTO = bodyDTO
        else {
            return urlRequest
        }
        
        guard let encodedBody = try? encoder.encode(bodyDTO)
        else {
            throw NetworkError.failedEncoding
        }
        urlRequest.httpBody = encodedBody
        return urlRequest
    }
}