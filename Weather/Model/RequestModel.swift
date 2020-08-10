//
//  RequestModel.swift
//  Weather
//
//  Created by Daniel Vazquez on 09/08/20.
//  Copyright © 2020 Daniel Vazquez. All rights reserved.
//

import Foundation

struct Request: Decodable {
    let type: String?
    let query: String?
    let languaje: String?
    let unit: String?
}
