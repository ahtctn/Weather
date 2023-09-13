//
//  Weather.swift
//  Weather
//
//  Created by Ahmet Ali ÇETİN on 13.09.2023.
//

import Foundation

struct Weather: Codable {
    let id: Int
    let main, description, icon: String
}
