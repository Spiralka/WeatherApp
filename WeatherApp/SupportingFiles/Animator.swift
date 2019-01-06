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
        
        UIView.animateKeyframes(withDuration: 4, delay: 0, options: .calculationModeCubic, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/16, animations: {
                view.layer.opacity = 1
            })
            UIView.addKeyframe(withRelativeStartTime: 7/8, relativeDuration: 1/16, animations: {
                view.layer.opacity = 0
            })
        }, completion: nil)
        
    }
}
