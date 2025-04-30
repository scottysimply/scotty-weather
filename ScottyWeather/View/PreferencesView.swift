//
//  PreferencesView.swift
//  ScottyWeather
//
//  Created by PATTY, SCOTT on 4/28/25.
//

import SwiftUI

struct PreferencesView: View {
    @State private var locationZip: String = ""
    var body: some View {
        VStack() {
            Text("Preferences")
                .font(.system(size: 48, weight: .bold))
            Group() {
                HStack() {
                    Text("Location")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField("Zip Code", text: $locationZip).frame(maxWidth: .infinity, alignment: .trailing)
                }
                Text("Temperature")
                Text("Weather")
                Text("Cloud Cover")
                Text("Humidity")
                Text("Wind Speed")
            }.frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 12)
                .font(.system(size: 24, weight: .medium))
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
    }
}

#Preview {
    PreferencesView()
}
