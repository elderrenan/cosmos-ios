//
//  CustomTextField.swift
//  Cosmos
//
//  Created by Matheus Aeroso on 26/04/16.
//  Copyright © 2016 Cosmos Labs. All rights reserved.
//

import UIKit

@IBDesignable
class CustomTextField: UITextField {
    @IBInspectable
    var borderColor : UIColor?
    @IBInspectable
    var placeholderColor : UIColor?
    override func drawRect(rect: CGRect) {
        let bottomBorder = CALayer()
        bottomBorder.frame = CGRectMake(0.0, self.frame.size.height - 1, self.frame.size.width, 1.0);
        bottomBorder.backgroundColor = borderColor!.CGColor
        self.layer.addSublayer(bottomBorder)
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder!, attributes: [NSForegroundColorAttributeName : placeholderColor!])
    }
}
