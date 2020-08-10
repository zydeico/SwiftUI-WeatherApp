//
//  CurrentModel.swift
//  Weather
//
//  Created by Daniel Vazquez on 09/08/20.
//  Copyright © 2020 Daniel Vazquez. All rights reserved.
//

import Foundation

struct Current: Decodable {
    let observationTime: String?
    let temperature: Int?
    let weatherCode: Int?
    let weatherIcons: [String?]
    let weatherDescriptions: [String?]
    let windSpeed: Int?
    let windDegree: Int?
    let windDir: String?
    let pressure: Int?
    let precip: Double?
    let humidity: Int?
    let cloudCover: Int?
    let feelsLike: Int?
    let uvIndex: Int?
    let visibility: Int?
}
