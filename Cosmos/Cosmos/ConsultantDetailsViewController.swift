//
//  ConsultantDetailsViewController.swift
//  Cosmos
//
//  Created by Matheus Aeroso on 10/05/16.
//  Copyright © 2016 Cosmos Labs. All rights reserved.
//

import UIKit

@IBDesignable
class ConsultantDetailsViewController: UIViewController {
    var currentConsultant : Consultant?
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var chatButton: UIButton!
    
    override func viewDidLoad() {
        nameLabel.text = currentConsultant?.title
        phoneLabel.text = currentConsultant?.phoneNumber
    }
    
    @IBAction func callButtonAction(sender: AnyObject) {
        print(self.currentConsultant!.title)
        print(self.currentConsultant!.phoneNumber)
        if let url = NSURL(string: "tel://\(self.currentConsultant!.phoneNumber)") {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    @IBAction func chatButtonAction(sender: AnyObject) {
        if let url = NSURL(string: "sms://\(self.currentConsultant!.phoneNumber)") {
            UIApplication.sharedApplication().openURL(url)
        }
        
    }
}
