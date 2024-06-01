//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Neha Ashwin on 6/1/24.
//

import Foundation
import CoreLocation

class WeatherManager {
    //function to access current weather from OpenWeather API
    func getCurrentWeather(latitude: CLLocationDegrees, longitude:  CLLocationDegrees) async throws{ //learn more about async at HTTP Request with Async Await
        
        //url is API call for current weather data using coordinate points
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\("fbeb6610846a3bf57fbc40a8f06564e2")&units=metric") else { fatalError("Missing URL")}
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
    }
}
