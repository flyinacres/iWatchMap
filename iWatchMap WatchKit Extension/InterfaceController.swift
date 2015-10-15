//
//  InterfaceController.swift
//  iWatchMap WatchKit Extension
//
//  Created by Ronald Fischer on 10/14/15.
//  Copyright (c) 2015 qpiapps. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    @IBOutlet weak var map: WKInterfaceMap!

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let location = CLLocationCoordinate2D(
            latitude: 51.52, longitude: -0.125)
        let span = MKCoordinateSpan(
            latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: location,
            span: span)
        map.setRegion(region)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
