//
//  MapViewController.swift
//  Cosmos
//
//  Created by Matheus Aeroso on 26/04/16.
//  Copyright © 2016 Cosmos Labs. All rights reserved.
//

import UIKit
import MapKit
import Firebase

class MapViewController: UIViewController, MKMapViewDelegate {
    var locations = [CLLocationCoordinate2DMake(-25.440154, -49.268655)]
    lazy var annotations : [Consultant] = [Consultant]()
    var currentSelectedConsultant : Consultant?
    
    
    @IBAction func signOut(sender: AnyObject?) {
        try! FIRAuth.auth()!.signOut()
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "isSignedIn")
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBOutlet weak var mapView: MKMapView! {
        didSet {
            mapView.delegate = self
        }
    }
    
    lazy var locationManager = CLLocationManager()
    
    func centerMapOnLocation(location: CLLocation) {
        let regionRadius: CLLocationDistance = 1000
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse {
            mapView.showsUserLocation = true
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
        
        annotations.append(Consultant(name: "Ana", phoneNumber: "12341234", latitude: -25.440234, longitude: -49.269225))
        annotations.append(Consultant(name: "Roberta", phoneNumber: "99871234", latitude: -25.441183, longitude: -49.271306))
        annotations.append(Consultant(name: "Joana", phoneNumber: "99311336", latitude: -25.445103, longitude: -49.272336))
        annotations.append(Consultant(name: "Letícia", phoneNumber: "83951534", latitude: -25.447121, longitude: -49.273390))
        
        mapView.addAnnotations(self.annotations)
    }
    
    func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation) {
        centerMapOnLocation(userLocation.location!)
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation.isKindOfClass(MKUserLocation) {
            return nil
        }
        
        let identifier = "pin"
        var view: MKPinAnnotationView
        
        if let dequeuedView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier)
            as? MKPinAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.pinTintColor = UIColor.purpleColor()
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.leftCalloutAccessoryView = UIImageView()
            view.rightCalloutAccessoryView = UIButton(type: .DetailDisclosure) as UIView
        }
        return view;
    }
    
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        currentSelectedConsultant = view.annotation as? Consultant;
        performSegueWithIdentifier("showDetailsSegue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetailsSegue" {
            let nextScene = segue.destinationViewController as! ConsultantDetailsViewController
            
            nextScene.currentConsultant = currentSelectedConsultant;
        }
    }
}
