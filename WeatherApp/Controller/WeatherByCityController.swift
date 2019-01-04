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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func updateWeatherByCityTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
