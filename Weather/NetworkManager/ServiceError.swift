//
//  ServiceError.swift
//  Weather
//
//  Created by Ahmet Ali ÇETİN on 13.09.2023.
//

import Foundation

enum ServiceError: Error {
case invalidURL
case invalidResponse
case invalidData
case decodingError(_ error: Error)
}
