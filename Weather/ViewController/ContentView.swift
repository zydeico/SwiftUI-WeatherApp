//
//  ContentView.swift
//  Weather
//
//  Created by Daniel Vazquez on 09/08/20.
//  Copyright © 2020 Daniel Vazquez. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var city = ""
    @State var description = ""
    @State var temperature = 0
    @State var imgData = Data()
    @State var weatherDescription = "Clear"
    
    func getWeatherData() {
        
        let jsonURLString = "http://api.weatherstack.com/current?access_key=e2e67e54f572ca441b450ea1c0fd30ee&query=New%20York"
        // Makr URL
        
        guard let url = URL(string: jsonURLString) else { return }
        // Create a session
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            // Check error
            if error != nil {
                print(error!.localizedDescription)
            }
            // Check 200 status
            guard let data = data else { return }
            do {
                let weather = try JSONDecoder().decode(Weather.self, from: data)
                self.city = weather.location?.region ?? ""
                self.temperature = (weather.current?.temperature) ?? 0
                self.description = weather.current?.weatherDescriptions[0] ?? ""
                let code = weather.current?.weatherCode
                self.weatherDescription = self.getWeatherDescription(code: code ?? 113)
                let url = URL(string: (weather.current?.weatherIcons[0]!)!)
                if let data = try? Data(contentsOf: url!) {
                    self.imgData = data
                }
            } catch let err {
                print ("Json Err", err)
            }
            // Start the session
        }.resume()
    }
    
    func getWeatherDescription (code : Int) -> String {
        switch code {
        case 113: return "Clear"
        case 116: return "Partly cloudy"
        case 119: return "Cloudy"
        case 122: return "Overcast"
        case 143: return "Mist"
        case 176: return "Patchy rain possible"
        case 179: return "Patchy snow possible"
        case 182: return "Patchy sleet possible"
        case 185: return "Patchy freezing drizzle possible"
        case 200: return "Thundery outbreaks possible"
        case 227: return "Blowing snow"
        case 230: return "Blizzard"
        case 248: return "Fog"
        case 260: return "Freezing fog"
        case 263: return "Patchy light drizzle"
        case 266: return "Light drizzle"
        case 281: return "Freezing drizzle"
        case 284: return "Heavy freezing drizzle"
        case 293: return "Patchy light rain"
        case 296: return "Light rain"
        case 299: return "Moderate rain at times"
        case 302: return "Moderate rain"
        case 305: return "Heavy rain at times"
        case 308: return "Heavy rain"
        case 311: return "Light freezing rain"
        default:
            return "Clear"
        }
    }
    
    var body: some View {
        Text("Hello, World!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
