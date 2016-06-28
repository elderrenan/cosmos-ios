//
//  CustomIconButton.swift
//  Cosmos
//
//  Created by Matheus Aeroso on 10/05/16.
//  Copyright © 2016 Cosmos Labs. All rights reserved.
//

import UIKit

@IBDesignable
class CustomIconButton: UIButton {
    @IBInspectable
    var title : UInt16!;
    
    override func awakeFromNib() {
        if let fontAwesome = UIFont(name: "FontAwesome", size: 18.0) {
            let callTitle = NSAttributedString(string: String(UnicodeScalar(title)), attributes: [NSFontAttributeName: fontAwesome, NSForegroundColorAttributeName: UIColor.whiteColor()])
            self.setAttributedTitle(callTitle, forState: .Normal)
        }
    }
}
