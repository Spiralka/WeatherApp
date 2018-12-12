//
//  ViewController.swift
//  WeatherApp
//
//  Created by  Евгений on 12/12/2018.
//  Copyright © 2018 LosAnatoly Inc. All rights reserved.
//

import UIKit
import CoreLocation

class LocationWeatherScreen: UIViewController {
    
    let locationManager = CLLocationManager()
    let networkManager = NetworkManager()
    let weatherModel = WeatherDataModel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLocationManager()
    }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
}



//MARK: CoreLocation delegate methods

extension LocationWeatherScreen: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        if location.horizontalAccuracy > 0 {
            locationManager.stopUpdatingLocation()
            locationManager.delegate = nil
            print("long = \(location.coordinate.longitude)", "lat = \(location.coordinate.latitude)")
            let latitude = String(location.coordinate.latitude)
            let longitude = location.coordinate.longitude.description
            let params = [latitude, longitude]
            
            networkManager.getWeatherData(parametrs: params)
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}

