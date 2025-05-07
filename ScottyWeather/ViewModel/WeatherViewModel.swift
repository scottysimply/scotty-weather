//
//  WeatherController.swift
//  ScottyWeather
//
//  Created by PATTY, SCOTT on 4/30/25.
//

import SwiftUI

class WeatherViewModel : ObservableObject {
    @Published var weather: WeatherRawModel?
    /*
     logic will look like:
     
     open current weather view
     send request for current weather with preferences
     if prefs don't exist, create them
     
     */
    
    func getWeatherFromLocation(location: LocationModel, preferences: PreferencesModel) async throws -> WeatherRawModel? {
        print("Beginning request")
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(location.lat)&lon=\(location.lon)&appid=\(preferences.apiKey)")
        
        // perform request
        let (data, response) = try await URLSession.shared.data(from: url!)
        print("Retrieved something")
        // cast to http
        if response as? HTTPURLResponse == nil {
            print("Couldn't cast")
            return nil
        }
        let httpResponse = response as? HTTPURLResponse
        print("Successfully casted")
        if httpResponse?.statusCode != 200 {
            return nil
        }
        print("Decoded!")
        return try JSONDecoder().decode(WeatherRawModel.self, from: data)
    }
}
