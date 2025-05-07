//
//  PreferencesModel.swift
//  ScottyWeather
//
//  Created by PATTY, SCOTT on 4/28/25.
//

import SwiftData


struct PreferencesModel {
    var apiKey: String = ""
    var zipCode: String = ""
    var temperatureMeasurement: TemperatureType = .f
    var speedMeasurement: SpeedType = .mph
    
}

enum TemperatureType: String, Hashable, CaseIterable, Identifiable {
    case f, c, k
    var id: String {
        return self.rawValue
    }
    func toStr() -> String {
        switch self {
            case .f: return "°F"
            case .c: return "°C"
            case .k: return "K"
        }
    }
    func valInUnits(temp: Int) -> Int {
        switch self {
            case .f: return (temp - 273) * 9/5 + 32
            case .c: return temp - 273
            case .k: return temp
        }
    }
}

enum SpeedType: String, Hashable, CaseIterable, Identifiable {
    case mph, kmh, mps
    var id: String {
        return self.rawValue
    }
    func toStr() -> String {
        switch self {
            case .mph: return "mph"
            case .kmh: return "km/h"
            case .mps: return "m/s"
        }
    }
    func valInUnits(speed: Double) -> Double {
        switch self {
            case .mph: return speed * 2.23694
            case .kmh: return speed * 3.6
            case .mps: return speed
        }
    }
}
