//
//  Endpoint.swift
//  Weather
//
//  Created by Ahmet Ali ÇETİN on 13.09.2023.
//

import Foundation

protocol EndpointProtocol {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String : String]? { get }
    var parameters: [String : Any]? { get }
    func request() -> URLRequest
}

enum Endpoint<T: Decodable> {
    case getWeather(lat: Double, lon: Double, appId: String)
}

extension Endpoint: EndpointProtocol {
    var baseURL: String {
        return Constants.baseURL
    }
    
    var path: String {
        switch self {
        case .getWeather:
            return Constants.path
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var headers: [String : String]? {
        var headers: [String : String]? {
            return ["Authorization": "Bearer \(Constants.api_key)"]
        }
        return headers
    }
    
    var parameters: [String : Any]? {
        switch self {
        case let .getWeather(lat, lon, appid):
            print("lat\(lat) lon \(lon)")
            return ["lat": lat, "lon": lon, "appid": appid]
        }
    }
    
    func request() -> URLRequest {
        guard var components = URLComponents(string: baseURL + path) else { fatalError("baseurlerror")}
        
        if let parameters = parameters {
            components.queryItems = parameters.map({ key, value in
                URLQueryItem(name: key, value: "\(value)")
            })
        }
        
        guard let url = components.url else { fatalError("url error")}
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        if let header = headers {
            for (key, value) in header {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        return request
    }
}


enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case patch = "PATCH"
    case delete = "DELETE"
}
