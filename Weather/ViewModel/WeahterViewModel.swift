//
//  WeahterViewModel.swift
//  Weather
//
//  Created by Ahmet Ali ÇETİN on 13.09.2023.
//

import Foundation

class WeatherViewModel {
    var eventHandler: ((_ event: Event) -> Void)?
    
    func getWeather() {
        self.eventHandler?(.loading)
        
        NetworkManager.shared.getWeatherData(completion: { result in
            switch result {
            case .success(let weather):
                print("Weather: \(weather.weather)\nName:\(weather.name)")
                print("\(weather.timezone) Ankara'nın timezone'u")
            case .failure(let error):
                print("\(error.localizedDescription) Network error happened in weather view model")
            }
        }, lat: 39.9334, lon: 32.8597, appId: Constants.api_key)
    }
}

extension WeatherViewModel {
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(_ error: Error?)
    }
}
