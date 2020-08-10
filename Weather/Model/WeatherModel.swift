//
//  WeatherModel.swift
//  Weather
//
//  Created by Daniel Vazquez on 09/08/20.
//  Copyright © 2020 Daniel Vazquez. All rights reserved.
//

import Foundation

struct WeatherModel: Decodable {
    let request: Request?
    let location: Location?
    let current: Current?
    
    func getWeatherData() {
        // Do something
    }
}
