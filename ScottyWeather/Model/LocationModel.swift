//
//  LocationModel.swift
//  ScottyWeather
//
//  Created by PATTY, SCOTT on 4/28/25.
//

struct LocationModel: Decodable {
    var zip, name: String
    var lat, lon: Double
    var country: String
}
