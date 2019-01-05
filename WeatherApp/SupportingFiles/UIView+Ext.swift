//
//  UIView+Ext.swift
//  WeatherApp
//
//  Created by  Евгений on 05/01/2019.
//  Copyright © 2019 LosAnatoly Inc. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    
    func setCornerRadius(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
}
