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
    
    func getWeatherData() {
        
        let jsonURLString = "http://api.weatherstack.com/current?access_key=e2e67e54f572ca441b450ea1c0fd30ee&query=New%20York"
        
        guard let url = URL(string: jsonURLString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            guard let data = data else { return }
            do {
                let weather = try JSONDecoder().decode(Weather.self, from: data)
            } catch let err {
                print ("Json Err", err)
            }
        }.resume()
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
