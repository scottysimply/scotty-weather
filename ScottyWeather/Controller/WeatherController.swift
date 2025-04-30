//
//  WeatherController.swift
//  ScottyWeather
//
//  Created by PATTY, SCOTT on 4/30/25.
//

import SwiftUI

class WeatherController : ObservableObject {
    @Published var currentWeather: WeatherModel?
    @Published var preferences: PreferencesModel?
    
    func getWeatherForZipCode(zipCode: Int) {
        do {
            
        } catch {
            
        }
    }
}
