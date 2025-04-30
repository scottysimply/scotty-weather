//
//  LocationController.swift
//  ScottyWeather
//
//  Created by PATTY, SCOTT on 4/30/25.
//

import SwiftUI
import CoreLocation

class LocationController: NSObject, CLLocationManagerDelegate, ObservableObject {
    @Published var location: LocationModel?
    @Published var preferences: PreferencesModel?
    @Published var errorMessage: String = ""
    @Published var hasError: Bool = false
    
    @Published var manager = CLLocationManager()
    
    func getLocationOrCurrent() async {
        // maybe create prefs
        if preferences == nil {
            preferences = PreferencesModel(apiKey: "a0ffedeb5bf1210fa0cece961ffd9f24")
        }
        if location != nil {
            return
        }
        // welp, gotta get a new location
        await getCurrentLocation()
    }
    func getCurrentLocation() async {
        var manager = CLLocationManager()
        manager.requestLocation( )
        var notMyLocation = manager.location
        // get zip from reverse geocode
        do {
            var pm = try await CLGeocoder().reverseGeocodeLocation(notMyLocation!)[0]
            // Create new location object
            location = LocationModel(zipCode: pm.postalCode!, name: pm.name!, lat: pm.location!.coordinate.latitude, long: pm.location!.coordinate.longitude)
        } catch {
            
        }
        
    }
}
