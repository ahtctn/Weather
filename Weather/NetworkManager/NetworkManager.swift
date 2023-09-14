//
//  NetworkManager.swift
//  Weather
//
//  Created by Ahmet Ali ÇETİN on 13.09.2023.
//

import Foundation

typealias NetworkResult <T: Decodable> = Result<T, ServiceError>
typealias NetworkCompletion <T: Decodable> = (NetworkResult<T>) -> Void

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    private func request<T: Decodable> (_ endpoint: Endpoint<T>, completion: @escaping NetworkCompletion<T>) {
        let task = URLSession.shared.dataTask(with: endpoint.request()) { data, response, error in
            guard let data = data, error == nil else {
                print("URLSessionError: \(String(describing: error))")
                completion(.failure(.invalidData))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                print("Invaild HTTP Response Status Code: \(httpResponse.statusCode)")
                completion(.failure(.invalidResponse))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch let DecodingError.dataCorrupted(context) {
                print(context)
            } catch let DecodingError.keyNotFound(key, context) {
                print("Key '\(key)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
                
            } catch let DecodingError.valueNotFound(value, context) {
                print("Value '\(value)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.typeMismatch(type, context)  {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch {
                print("error: ", error)
                completion(.failure(.decodingError(error)))
            }
        }
        task.resume()
    }
    
    func getWeatherData(completion: @escaping NetworkCompletion<WeahterModel>, lat: Double, lon: Double, appId: String) {
        let endpoint = Endpoint<WeahterModel>.getWeather(lat: lat, lon: lon, appId: appId)
        request(endpoint, completion: completion)
    }
}
