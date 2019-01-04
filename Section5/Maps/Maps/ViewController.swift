//
//  ViewController.swift
//  Maps
//
//  Created by Quentin Pousseur on 04/01/2019.
//  Copyright © 2019 Quentin Pousseur. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let latitude: CLLocationDegrees = 50.6657252
        let longitude: CLLocationDegrees = 4.5868116
        
        let latDelta: CLLocationDegrees = 0.05
        let lonDelta: CLLocationDegrees = 0.05
        
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        
        let location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let region: MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        
        map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        
        annotation.title = "LLN"
        annotation.subtitle = "One day I'll go there..."
        annotation.coordinate = location
        map.addAnnotation(annotation)
        
        let uilgpr = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longpress(gestureRecognizer:)))
        
        uilgpr.minimumPressDuration = 2
        
        map.addGestureRecognizer(uilgpr)
    }
    
    @objc func longpress(gestureRecognizer: UIGestureRecognizer){
        
        let touchPoint = gestureRecognizer.location(in: self.map)
        
        let coordinates = map.convert(touchPoint, toCoordinateFrom: self.map)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinates
        annotation.title = "New Place"
        annotation.subtitle = "Maybe I'll go there too"
        
        map.addAnnotation(annotation)
        
    }


}

