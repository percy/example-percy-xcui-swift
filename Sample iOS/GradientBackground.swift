//
//  GradientBackground.swift
//  Sample iOS
//
//  Created by Pankaj Yadav on 12/04/23.
//  Copyright © 2023 BrowserStack. All rights reserved.
//

import Foundation
import UIKit

extension UIView  {
    func setGradientBackground(colorOne: UIColor, colorTwo: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        
        layer.insertSublayer(gradientLayer, at: 0)
        
    }
    
    
}
