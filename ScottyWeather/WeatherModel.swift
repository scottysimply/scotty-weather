//
//  WeatherModel.swift
//  ScottyWeather
//
//  Created by PATTY, SCOTT on 4/28/25.
//
import _math

struct WeatherModel {
    public var temperature: Int
    public var location: LocationModel
    public var windSpeed: Int
    public var windDirection: WindDirection
    public var humidity: Float
    public var cloudCover: Float
}
enum WindDirection: String, CaseIterable {
    case n, nne, ne, ene, e, ese, se, sse, s, ssw, sw, wsw, w, wnw, nw, nnw
    init(degrees: Int) {
        let allCases = AllCases()
        // Calculates the wind direction abbr from hell
        let index: Int = Int(round((Double(degrees) / (360.0 / Double(allCases.count))), )) % AllCases().count
        self = AllCases()[index]
    }
    public var Value: String {
        return rawValue.uppercased()
    }
}

