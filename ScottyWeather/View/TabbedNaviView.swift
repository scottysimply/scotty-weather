//
//  ContentView.swift
//  ScottyWeather
//
//  Created by PATTY, SCOTT on 4/28/25.
//

import SwiftUI

struct TabbedNaviView: View {
    init() {
        preferences = PreferenceViewModel()
        currentWeather = WeatherViewModel()
        currentLocation = LocationViewModel()
    }
    @ObservedObject var preferences: PreferenceViewModel
    @ObservedObject var currentWeather: WeatherViewModel
    @ObservedObject var currentLocation: LocationViewModel
    @State var selectedTab = 1
    @State var taskId = UUID()
    var body: some View {
        TabView(selection: $selectedTab) {
            PreferencesView(preferenceModel: preferences, currentWeather: currentWeather, currentLocation: currentLocation, selectedIndex: -1)
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Preferences")
                }.tag(1)
            CurrentWeatherView(preferences: preferences, currentWeather: currentWeather, currentLocation: currentLocation)
                .tabItem {
                    Image(systemName: "cloud.sun.fill")
                    Text("Weather")
                }.tag(2)
                .task(id: taskId) {
                    await requestWeather()
                }
            WeatherDetailsView(preferences: preferences, currentWeather: currentWeather, currentLocation: currentLocation)
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Full Weather")
                }.tag(3)
                .task(id: taskId) {
                    await requestWeather()
                }
        }.onChange(of: selectedTab)  { of, perf in 
            taskId = UUID()
        }
    }
    @Sendable func requestWeather() async {
        if preferences.preferences.apiKey.isEmpty {
            return
        }
        do {
                currentLocation.location = try await currentLocation.getLocationFromZip(preferences.preferences.zipCode, preferences.preferences.apiKey)
                print("Location: \(currentLocation.location!.name)")
                print("lat=\(currentLocation.location!.lat),lon=\(currentLocation.location!.lon)")

            let ret = try await currentWeather.getWeatherFromLocation(location: currentLocation.location!, preferences: preferences.preferences)
            if let newRet: WeatherRawModel = ret {
                currentWeather.weather = newRet
                print(newRet.name)
            }
        } catch {
            print("Error occured in api request")
            print(error)
        }
    }

}

#Preview {
    TabbedNaviView()
}
