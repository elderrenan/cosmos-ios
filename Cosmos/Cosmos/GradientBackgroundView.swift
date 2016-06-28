//
//  GradientBackgroundView.swift
//  Cosmos
//
//  Created by Matheus Aeroso on 26/04/16.
//  Copyright © 2016 Cosmos Labs. All rights reserved.
//
import UIKit

@IBDesignable
class GradientBackgroundView: UIView {
    @IBInspectable var startingColor : UIColor?
    @IBInspectable var endingColor : UIColor?
    
    override func drawRect(rect: CGRect) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        if startingColor != nil && endingColor != nil {
            gradient.colors = [startingColor!.CGColor, endingColor!.CGColor]
        }
        self.layer.insertSublayer(gradient, atIndex: 0)
    }
}
