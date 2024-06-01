//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Neha Ashwin on 5/28/24.
//

import Foundation
//  Framework from Apple to get User's current location
import CoreLocation

//  NSObject:
//  ObservableObject:
//  CLLocationManagerDelegate:
class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    //  create manager and instance of CLLocationManager
    let manager = CLLocationManager()
    
    //PUBLISHED VARIABLES
    //  published variable location
    @Published var location: CLLocationCoordinate2D?    //  '?' means optional, bc user may not grant access to location
    @Published var isLoading = false
    
    // FUNCTIONS
    //  CURRENTLY: this app requests the user's location every time they open the app (goal: change request frequency)
        //  APPLE: Adding Location Services to Your App
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestLocation() {
        isLoading = true
        manager.requestLocation()
    }
    
    //  functions to make CLLocationManagerDelegate work
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false
    }
    
    //  function to handle errors
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("Error getting location", error)
        isLoading = false
    }
}
