//
//  PreferencesView.swift
//  ScottyWeather
//
//  Created by PATTY, SCOTT on 4/28/25.
//

import SwiftUI

struct PreferencesView: View {
    @ObservedObject var preferenceModel: PreferenceViewModel
    @ObservedObject var currentWeather: WeatherViewModel
    @ObservedObject var currentLocation: LocationViewModel
    @State private var apiKey: String = ""
    @State private var locationZip: String = ""
    @State var selectedIndex: Int
    var body: some View {
        VStack(alignment: .center, spacing: 12) {
            // Header
            Text("Preferences")
                .font(.system(size: 48, weight: .bold))
            VStack(alignment: .leading, spacing: 24) {
                VStack {
                    Text("Api Key")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField("Enter Api", text: $apiKey).frame(maxWidth: .infinity, alignment: .trailing)
                        .onSubmit {
                            preferenceModel.setApiKey(apiKey)
                        }
                }
                VStack {
                    Text("Location")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField("Enter Zip", text: $locationZip).frame(maxWidth: .infinity, alignment: .trailing)
                        .onSubmit {
                            preferenceModel.setLocation(locationZip)
                        }
                    // Show saved locations
                    HStack {
                        Button("Save Location", systemImage: "star.fill", action: {
                            if locationZip != "" && !preferenceModel.listOfZips.contains(locationZip) {
                                preferenceModel.listOfZips.append(locationZip)
                                preferenceModel.setLocation(locationZip)
                            }
                            selectedIndex = preferenceModel.listOfZips.count - 1
                            print("Location Saved")
                        })
                        Button("Remove Location", systemImage: "star.slash", action: {
                            if locationZip != "" && selectedIndex < preferenceModel.listOfZips.count && selectedIndex >= 0 {
                                preferenceModel.listOfZips.remove(at: selectedIndex)
                                preferenceModel.setLocation(preferenceModel.listOfZips[0])
                                print("Location Removed")
                            }
                        })
                    }
                    List {
                        ForEach (preferenceModel.listOfZips, id: \.self) { zip in
                            Text(zip)
                                .onTapGesture {
                                    print("Selected \(zip)")
                                    if let zipInList = preferenceModel.listOfZips.firstIndex(of: zip) {
                                        selectedIndex = zipInList
                                        locationZip = zip
                                        preferenceModel.setLocation(zip)
                                        print(locationZip)
                                    }
                                }
                                .background(selectedIndex == preferenceModel.listOfZips.firstIndex(of: zip) ? Color.gray : Color.clear)
                        }
                    }
                }
                VStack {
                    Text("Temperature")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Picker("Units", selection: $preferenceModel.preferences.temperatureMeasurement) {
                        ForEach (TemperatureType.allCases) { measurement in
                            Text(measurement.toStr()).tag(measurement)
                        }
                    }
                }
                VStack {
                    Text("Speed")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Picker("Units", selection: $preferenceModel.preferences.speedMeasurement) {
                        ForEach (SpeedType.allCases) { measurement in
                            Text(measurement.toStr()).tag(measurement)
                        }
                    }
                }
            }.frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 24)
                .font(.system(size: 24, weight: .medium))
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
    }
}
