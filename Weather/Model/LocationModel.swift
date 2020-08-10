//
//  LocationModel.swift
//  Weather
//
//  Created by Daniel Vazquez on 09/08/20.
//  Copyright © 2020 Daniel Vazquez. All rights reserved.
//

import Foundation

struct Location: Decodable {
    let name: String?
    let country: String?
    let region: String?
    let lat: String?
    let long: String?
    let timezoneId: String?
    let localTimeEpoch: Int?
    let utcOffSet: String?
}
