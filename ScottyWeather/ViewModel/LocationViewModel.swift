//
//  LocationController.swift
//  ScottyWeather
//
//  Created by PATTY, SCOTT on 4/30/25.
//

import SwiftUI
import CoreLocation

class LocationViewModel: NSObject, CLLocationManagerDelegate, ObservableObject {
    @Published var location: LocationModel?
    @Published var manager = CLLocationManager()
    
    func getLocationFromZip(_ zip: String, _ apiKey: String) async throws -> LocationModel? {
        let url = URL(string: "http://api.openweathermap.org/geo/1.0/zip?zip=\(zip),US&appid=\(apiKey)")
        
        // perform request
        let (data, response) = try await URLSession.shared.data(from: url!)
        // cast to http
        if response as? HTTPURLResponse == nil {
            return nil
        }
        let httpResponse = response as? HTTPURLResponse
        if httpResponse?.statusCode != 200 {
            return nil
        }
        return try JSONDecoder().decode(LocationModel.self, from: data)
    }
}
