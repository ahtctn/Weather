//
//  WeahterViewModel.swift
//  Weather
//
//  Created by Ahmet Ali ÇETİN on 13.09.2023.
//

import Foundation

class WeatherViewModel {
    var weatherModel: WeahterModel?
    var eventHandler: ((_ event: Event) -> Void)?
    
    func getWeather(lat: Double, lon: Double) {
        self.eventHandler?(.loading)
        
        NetworkManager.shared.getWeatherData(completion: { result in
            switch result {
            case .success(let weather):
                print("Weather: \(weather.weather)\nName:\(weather.name)")
                print("\(weather.timezone) Ankara'nın timezone'u")
                self.weatherModel = weather
                self.eventHandler?(.dataLoaded)
                
            case .failure(let error):
                print("\(error.localizedDescription) Network error happened in weather view model")
                self.eventHandler?(.error(error))
            }
        }, lat: lat, lon: lon, appId: Constants.api_key)
    }
    
    func getWeatherIcons() -> [String: String] {
        let weatherIcons: [String: String] = [
            "01d": Constants.WeatherIcons.d01,
            "01n": Constants.WeatherIcons.n01,
            "02d": Constants.WeatherIcons.d02,
            "02n": Constants.WeatherIcons.n02,
            "03d": Constants.WeatherIcons.d03,
            "03n": Constants.WeatherIcons.n03,
            "04d": Constants.WeatherIcons.d04,
            "04n": Constants.WeatherIcons.n04,
            "09d": Constants.WeatherIcons.d09,
            "09n": Constants.WeatherIcons.n09,
            "10d": Constants.WeatherIcons.d10,
            "10n": Constants.WeatherIcons.n10,
            "11d": Constants.WeatherIcons.d11,
            "11n": Constants.WeatherIcons.n11,
            "14d": Constants.WeatherIcons.d14,
            "14n": Constants.WeatherIcons.n14,
            "50d": Constants.WeatherIcons.d50,
            "50n": Constants.WeatherIcons.n50,
        ]
        return weatherIcons
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
