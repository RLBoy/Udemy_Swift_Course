//
//  ViewController.swift
//  Marker Map
//
//  Created by Quentin Pousseur on 05/01/2019.
//  Copyright © 2019 Quentin Pousseur. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var map: MKMapView!
    
    var manager =  CLLocationManager()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let uilgpr = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longpress(gestureRecognizer:)))
        uilgpr.minimumPressDuration = 2
        map.addGestureRecognizer(uilgpr)
        
        if activePlace == -1 {
            
            manager.delegate = self
            manager.desiredAccuracy = kCLLocationAccuracyBest
            manager.requestWhenInUseAuthorization()
            manager.startUpdatingLocation()
            
            
        }else{
            
            // Get place details to display on the map
            
            if places.count > activePlace {
                
                if let name = places[activePlace]["name"]{
                    
                    if let lat = places[activePlace]["lat"]{
                        
                        if let long = places[activePlace]["long"]{
                            
                            if let latitude = Double(lat){
                                
                                if let longitude = Double(long){
                                    
                                    let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                                    
                                    let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                                    
                                    let region = MKCoordinateRegion(center: coordinate, span: span)
                                    
                                    self.map.setRegion(region, animated: true)
                                    
                                    let annotation = MKPointAnnotation()
                                    annotation.coordinate = coordinate
                                    annotation.title = name
                                    self.map.addAnnotation(annotation)
                                }
                                
                            }
                            
                        }
                        
                    }
                    
                }
                
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        
        let region = MKCoordinateRegion(center: location, span: span)
        
        self.map.setRegion(region, animated: true)
    }
    
    @objc func longpress(gestureRecognizer: UIGestureRecognizer){
        
        if gestureRecognizer.state == UIGestureRecognizer.State.began{
        
        let touchPoint = gestureRecognizer.location(in: self.map)
        
        let newCoordinate = self.map.convert(touchPoint, toCoordinateFrom: self.map)
        
        let location = CLLocation(latitude: newCoordinate.latitude, longitude: newCoordinate.longitude)
        
        var title = ""
        
        CLGeocoder().reverseGeocodeLocation(location) { (placemarks, error) in
            
            if error != nil {
                print(error!)
            }else{
                if let placemark = placemarks?[0]{
                    
                    if placemark.subThoroughfare != nil {
                        title += placemark.subThoroughfare! + " "
                    }
                    
                    if placemark.thoroughfare != nil {
                        title += placemark.thoroughfare!
                    }
                    
                }
            }
            
            if title == "" {
                title = "Added \(NSDate())"
            }
            
            let annotation = MKPointAnnotation()
            
            annotation.coordinate = newCoordinate
            annotation.title = title
            
            self.map.addAnnotation(annotation)
            
            places.append(["name": title, "lat": String(newCoordinate.latitude), "long": String(newCoordinate.longitude)])
            UserDefaults.standard.set(places, forKey: "places")
        }
        
    }
        
    }
    


}

