//
//  CurrentWeatherView.swift
//  ScottyWeather
//
//  Created by PATTY, SCOTT on 4/28/25.
//

import SwiftUI

struct CurrentWeatherView: View {
    @ObservedObject var preferences: PreferenceViewModel
    @ObservedObject var currentWeather: WeatherViewModel
    @ObservedObject var currentLocation: LocationViewModel
    var body: some View {
        VStack() {
            if let safeWeather = currentWeather.weather {
                    Text(safeWeather.name)
                    .font(.system(size: 48, weight: .bold))
                HStack {
                    Text("Feels Like")
                    Spacer()
                    let unit = preferences.preferences.temperatureMeasurement
                    Text("\(unit.valInUnits(temp: Int(safeWeather.main.feelsLike))) \(unit.toStr())")
                }
                HStack {
                    Text("Weather")
                    Spacer()
                    Text("\(safeWeather.weather[0].main)")
                }
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .font(.system(size: 24, weight: .semibold))
            .padding(.all, 24)
    }
}
