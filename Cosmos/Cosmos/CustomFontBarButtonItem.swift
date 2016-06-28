//
//  CustomFontBarButtonItem.swift
//  Cosmos
//
//  Created by Matheus Aeroso on 26/04/16.
//  Copyright © 2016 Cosmos Labs. All rights reserved.
//

import UIKit

@IBDesignable
class CustomFontBarButtonItem: UIBarButtonItem {
    @IBInspectable var customTitle : String!
    
    override func awakeFromNib() {
        if let fontAwesome = UIFont(name: "FontAwesome", size: 18.0) {
            self.setTitleTextAttributes([NSFontAttributeName: fontAwesome, NSForegroundColorAttributeName: UIColor.whiteColor()], forState: UIControlState.Normal)
            self.title = "\u{0000f03a}";
        }
    }
}
