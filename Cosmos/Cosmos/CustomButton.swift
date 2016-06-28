//
//  CustomButton.swift
//  Cosmos
//
//  Created by Matheus Aeroso on 26/04/16.
//  Copyright © 2016 Cosmos Labs. All rights reserved.
//

import UIKit

@IBDesignable
class CustomButton: UIButton {
    override func drawRect(rect: CGRect) {
        layer.cornerRadius = 8
        layer.borderColor = UIColor.whiteColor().CGColor
        layer.borderWidth = 1
    }
}
