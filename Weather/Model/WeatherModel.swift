//
//  WeatherModel.swift
//  Weather
//
//  Created by Ahmet Ali ÇETİN on 13.09.2023.
//

import Foundation

struct WeahterModel: Codable {
    let coord: CoordinateModel
    let weather: [Weather]
    let base: String
    let main: MainModel
    let visibility: Int
    let wind: WindModel
    let clouds: CloudsModel
    let dt: Int
    let sys: SysModel
    let timezone, id: Int
    let name: String
    let cod: Int
}
