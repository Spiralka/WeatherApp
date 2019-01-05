//
//  WeatherByCityController.swift
//  WeatherApp
//
//  Created by  Евгений on 04/01/2019.
//  Copyright © 2019 LosAnatoly Inc. All rights reserved.
//

import Foundation
import UIKit

class WeatherByCityController: UIViewController {
    
    var delegate: CanReceive?
    
    @IBOutlet weak var updateWeatherButton: UIButton!
    @IBOutlet weak var cityTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        updateWeatherButton.setCornerRadius(radius: 5)
        cityTextField.setCornerRadius(radius: 5)
    }
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func updateWeatherByCityTapped(_ sender: UIButton) {
        delegate?.receivedCityName(city: cityTextField.text ?? "")
        dismiss(animated: true, completion: nil)
    }
}
