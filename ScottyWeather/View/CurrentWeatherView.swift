//
//  CurrentWeatherView.swift
//  ScottyWeather
//
//  Created by PATTY, SCOTT on 4/28/25.
//

import SwiftUI

struct CurrentWeatherView: View {
    var body: some View {
        VStack() {
            Text("Now")
                .font(.system(size: 48, weight: .bold))
            List() {
                Text("Location")
                Text("Temperature")
                Text("Weather")
                Text("Cloud Cover")
                Text("Humidity")
                Text("Wind Speed")
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .padding(.leading, 12)
                .font(.system(size: 24, weight: .medium))
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
    }
}

#Preview {
    CurrentWeatherView()
}
