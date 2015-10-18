//
//  InterfaceController.swift
//  iWatchMap WatchKit Extension
//
//  Created by Ronald Fischer on 10/14/15.
//  Copyright (c) 2015 qpiapps. All rights reserved.
//

import WatchKit
import Foundation
import CoreLocation


class InterfaceController: WKInterfaceController, CLLocationManagerDelegate {
    @IBOutlet weak var map: WKInterfaceMap!
    var locationManager = CLLocationManager()

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
    func setMapAtLocation(latitude: Double, longitude: Double) {
        let location = CLLocationCoordinate2D(
            latitude: latitude, longitude: longitude)
        let span = MKCoordinateSpan(
            latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: location,
            span: span)
        map.setRegion(region)
        
        map.removeAllAnnotations()
        //map.addAnnotation(location, withPinColor: WKInterfaceMapPinColor.Green)
        //map.add
        map.addAnnotation(location, withImageNamed: "William.png", centerOffset: CGPoint(x: 0, y: 0))
        
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    var savedLatitude: Double = 0.0
    var savedLongitude: Double = 0.0

    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        let locationArray = locations as NSArray
        let location = locationArray[0] as! CLLocation
        
        let newLat = location.coordinate.latitude
        let newLong = location.coordinate.longitude
    
        if newLat != savedLatitude && newLong != savedLongitude {
            setMapAtLocation(newLat, longitude: newLong)
            savedLatitude = newLat
            savedLongitude = newLong
            
            println(newLat)
            println(newLong)
        }

    }
}
