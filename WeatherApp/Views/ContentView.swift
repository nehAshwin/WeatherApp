//
//  ContentView.swift
//  WeatherApp
//
//  Created by Neha Ashwin on 5/28/24.
//

import SwiftUI

struct ContentView: View {
    //  StateObject so app is notified every time location changes?
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        VStack {
            if let location = locationManager.location {
                Text("Your coordinates are: \(location.longitude), \(location.latitude)")
            } else {
                if locationManager.isLoading {
                    LoadingView()
                }
                else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
        }
        .background(Color(hue: 0.7, saturation: 0.924, brightness: 0.511))
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ContentView()
}
