//
//  SysModel.swift
//  Weather
//
//  Created by Ahmet Ali ÇETİN on 13.09.2023.
//

import Foundation

struct SysModel: Codable {
    let type, id: Int
    let country: String
    let sunrise, sunset: Int
}
