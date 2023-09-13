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
        
        var weather: [WeahterModel] = []
        
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
