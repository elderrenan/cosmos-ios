//
//  ConsultantAnnotation.swift
//  Cosmos
//
//  Created by Matheus Aeroso on 26/06/16.
//  Copyright © 2016 Cosmos Labs. All rights reserved.
//

import MapKit

extension Consultant: MKAnnotation {
    public var title: String? { return self.name }
    public var subtitle: String? { return self.phoneNumber }
    public var coordinate : CLLocationCoordinate2D {
        return CLLocationCoordinate2DMake(self.latitude, self.longitude)
    }
}