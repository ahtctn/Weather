//
//  Constants.swift
//  Weather
//
//  Created by Ahmet Ali ÇETİN on 13.09.2023.
//

import Foundation

enum Constants {
    static let api_key = "2413b0844755bb846296680c7a09029a"
    static let baseURL = "https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=2413b0844755bb846296680c7a09029a"
    static let path = "/data/2.5/weather"
    static let header = ["Authorization": "Bearer \(api_key)"]
    
    
}
