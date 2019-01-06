//
//  ViewController.swift
//  WeatherApp
//
//  Created by  Евгений on 12/12/2018.
//  Copyright © 2018 LosAnatoly Inc. All rights reserved.
//

import UIKit
import CoreLocation

class LocationWeatherScreen: UIViewController, CanReceive {
    
    
    
    let locationManager = CLLocationManager()
    let networkManager = NetworkManager()
    var weatherModel: WeatherStruct?
    var weatherManager = WeatherDataModel()
    let animationsManager = SimpleAnimator()
    
    @IBOutlet weak var wrongLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var conditionIcon: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLocationManager()
    }
    
    @IBAction func nextScreenTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "goToWeatherByCity", sender: self)
    }
    
    func receivedCityName(city: String) {
        print(city)
        networkManager.getWeatherDataByCity(city: city) { (result) in
            switch result {
            case .success(let weatherModel):
                self.weatherModel = weatherModel
                DispatchQueue.main.async {
                    self.updateWeatherInfo(info: weatherModel)
                }
                print(weatherModel)
            case .failure(let error):
                DispatchQueue.main.async {
                    self.animationsManager.fadeInAndOutAnimation(view: self.wrongLabel)
                    
                }
                print("Error \(error.localizedDescription)")
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToWeatherByCity" {
            guard let destinationVc = segue.destination as? WeatherByCityController else { return }
            destinationVc.delegate = self
        }
    }
    
    
    func setupViews() {
        wrongLabel.layer.opacity = 0
        conditionIcon.image = UIImage(named: "Cloud-Refresh")
        tempLabel.text = "--℃"
        cityLabel.text = "Updating..."
    }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
    func updateWeatherInfo(info: WeatherStruct) {
        tempLabel.text = Int(info.main.temp).description + "℃"
        cityLabel.text = info.name
        conditionIcon.image = UIImage(named: weatherManager.updateWeatherIcon(condition: info.weather[0].id))
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return .lightContent
        }
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
            let latitude = location.coordinate.latitude.description
            let longitude = location.coordinate.longitude.description
            
            networkManager.getWeatherData(lat: latitude, lon: longitude) { (result) in
                switch result {
                case .success(let weatherModel):
                    self.weatherModel = weatherModel
                    DispatchQueue.main.async {
                        self.updateWeatherInfo(info: weatherModel)
                    }
                    print(weatherModel)
                case .failure(let error):
                    print("Error \(error.localizedDescription)")
                }
            }
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}

