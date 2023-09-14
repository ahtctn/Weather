//
//  Constants.swift
//  Weather
//
//  Created by Ahmet Ali ÇETİN on 13.09.2023.
//

import Foundation

enum Constants {
    static let api_key = "2413b0844755bb846296680c7a09029a"
    static let baseURL = "https://api.openweathermap.org/data/2.5"
    //data/2.5/weather?lat=44.34&lon=10.99&appid=2413b0844755bb846296680c7a09029a"
    static let path = "/weather"
    static let header = ["Authorization": "Bearer \(api_key)"]
    
    
    enum Locations {
        static let latAnkara: Double = 39.9334
        static let lonAnkara: Double = 32.8597
        
        static let latLondon: Double = 51.5072
        static let lonLondon: Double = 0.1276
        
        static let latMoscow: Double = 55.7558
        static let lonMoscow: Double = 37.6173
        
        static let latBeijing: Double = 39.9042
        static let lonBeijing: Double = 116.4074
    }
    
    enum WeatherIcons {
        static let d01: String = "https://openweathermap.org/img/wn/01d@2x.png"
        static let n01: String = "https://openweathermap.org/img/wn/01n@2x.png"

        static let d02: String = "https://openweathermap.org/img/wn/02d@2x.png"
        static let n02: String = "https://openweathermap.org/img/wn/02n@2x.png"
        
        static let d03: String = "https://openweathermap.org/img/wn/03d@2x.png"
        static let n03: String = "https://openweathermap.org/img/wn/03n@2x.png"
        
        static let d04: String = "https://openweathermap.org/img/wn/04d@2x.png"
        static let n04: String = "https://openweathermap.org/img/wn/04n@2x.png"
        
        static let d09: String = "https://openweathermap.org/img/wn/09d@2x.png"
        static let n09: String = "https://openweathermap.org/img/wn/09n@2x.png"
        
        static let d10: String = "https://openweathermap.org/img/wn/10d@2x.png"
        static let n10: String = "https://openweathermap.org/img/wn/10n@2x.png"
        
        static let d11: String = "https://openweathermap.org/img/wn/11d@2x.png"
        static let n11: String = "https://openweathermap.org/img/wn/11n@2x.png"
        
        static let d14: String = "https://openweathermap.org/img/wn/14d@2x.png"
        static let n14: String = "https://openweathermap.org/img/wn/14n@2x.png"
        
        static let d50: String = "https://openweathermap.org/img/wn/50d@2x.png"
        static let n50: String = "https://openweathermap.org/img/wn/50n@2x.png"
    }
    
    
    
}
