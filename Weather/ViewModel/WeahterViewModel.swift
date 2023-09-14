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
        
        NetworkManager.shared.getWeatherData { result in
            switch result {
            case .success(let weather):
                print(weather.weather)
                print(weather.base)
                print("success")
            case .failure(let error):
                // Hata durumunda
                print(error.localizedDescription)
            }
        }
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
