//
//  CurrentWeatherView.swift
//  ScottyWeather
//
//  Created by PATTY, SCOTT on 5/7/25.
//

import SwiftUI

struct WeatherDetailsView: View {
    @ObservedObject var preferences: PreferenceViewModel
    @ObservedObject var currentWeather: WeatherViewModel
    @ObservedObject var currentLocation: LocationViewModel
    var body: some View {
        VStack() {
            Text("Full Weather")
                .font(.system(size: 48, weight: .bold))
            if let safeWeather = currentWeather.weather {
                HStack {
                    Text("Location")
                    Spacer()
                    Text("\(safeWeather.name), \(currentLocation.location!.country)")
                }
                HStack {
                    Text("Zip")
                    Spacer()
                    Text(currentLocation.location!.zip)
                }
                HStack {
                    Text("Feels Like")
                    Spacer()
                    let unit = preferences.preferences.temperatureMeasurement
                    Text("\(unit.valInUnits(temp: Int(safeWeather.main.feelsLike))) \(unit.toStr())")
                }
                HStack {
                    Text("Actual Temperature")
                    Spacer()
                    let unit = preferences.preferences.temperatureMeasurement
                    Text("\(unit.valInUnits(temp: Int(safeWeather.main.temp))) \(unit.toStr())")
                }
                HStack {
                    Text("Weather")
                    Spacer()
                    Text("\(safeWeather.weather[0].main)")
                }
                HStack {
                    Text("Cloud Coverage")
                    Spacer()
                    Text("\(safeWeather.clouds.all)%")
                }
                HStack {
                    Text("Humidity")
                    Spacer()
                    Text("\(safeWeather.main.humidity)%")
                }
                HStack {
                    Text("Wind Speed")
                    let unit = preferences.preferences.speedMeasurement
                    Text("\(unit.valInUnits(speed: safeWeather.wind.speed))) \(unit.toStr())")
                }
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .padding(.all, 24)
    }
    @Sendable func requestWeather() async {
        if preferences.preferences.apiKey.isEmpty {
            return
        }
        do {
            if currentLocation.location == nil {
                currentLocation.location = try await currentLocation.getLocationFromZip(preferences.preferences.zipCode, preferences.preferences.apiKey)
                print("Location: \(currentLocation.location!.name)")
                print("lat=\(currentLocation.location!.lat),lon=\(currentLocation.location!.lon)")
            }
            let ret = try await currentWeather.getWeatherFromLocation(location: currentLocation.location!, preferences: preferences.preferences)
            if let newRet: WeatherRawModel = ret {
                currentWeather.weather = newRet
            }
        } catch {
            print("Error occured in api request")
            print(error)
        }
    }
}
