//
//  PreferenceController.swift
//  ScottyWeather
//
//  Created by PATTY, SCOTT on 5/5/25.
//

import SwiftUI

class PreferenceViewModel : ObservableObject {
    init() {
        preferences = PreferencesModel()
    }
    @Published var preferences: PreferencesModel
    @Published var listOfZips: [String] = []
    func setApiKey(_ apiKey: String) {
        preferences.apiKey = apiKey
        print("API Key set to \(apiKey)")
    }
    func setLocation(_ zipCode: String) {
        // Convert to integer
        if zipCode.count != 5 {
            return
        }
        preferences.zipCode = zipCode
        print("Location set to \(zipCode)")
    }
}
