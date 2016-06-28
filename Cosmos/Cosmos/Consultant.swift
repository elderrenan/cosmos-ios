//
//  Consultant.swift
//  Cosmos
//
//  Created by Matheus Aeroso on 10/05/16.
//  Copyright © 2016 Cosmos Labs. All rights reserved.
//

import MapKit

public class Consultant: NSObject {
    internal var name : String
    internal var phoneNumber : String
    internal var profilePhoto: UIImage?
    internal var latitude : Double
    internal var longitude: Double
    
    init(name: String, phoneNumber: String, latitude: Double, longitude: Double) {
        self.name = name
        self.phoneNumber = phoneNumber
        self.latitude = latitude
        self.longitude = longitude
        
        super.init()
    }
}
