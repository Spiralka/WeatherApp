//
//  Animator.swift
//  WeatherApp
//
//  Created by  Евгений on 04/01/2019.
//  Copyright © 2019 LosAnatoly Inc. All rights reserved.
//

import Foundation
import UIKit

class SimpleAnimator {
    
    func fadeInAndOutAnimation(view: UILabel) {
        UIView.animate(withDuration: 2) {
            view.layer.opacity = 1
        }
        
        UIView.animate(withDuration: 3.5) {
            view.layer.opacity = 0
        }
        
    }
}
