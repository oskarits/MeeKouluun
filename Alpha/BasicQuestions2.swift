//
//  BasicQuestions2.swift
//  Alpha
//
//  Created by Otto on 20/11/2019.
//  Copyright © 2019 Jari Pietikäinen. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class BasicQuestions2: UIViewController, CLLocationManagerDelegate {
    var locationManager = CLLocationManager()
    var geoCoder = CLGeocoder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setup location manager
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        // ask for location
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        //print("Postal code \(self.postalCode)")
        print("Location fetching started...")
    }
    
    // succesful location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print("Found user's location: \(location)")
            
            // save location
            
            
            // center map according to location
            mapView.centerCoordinate = location.coordinate
        }
    }
    
    // location failed
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }
    
    // MARK: Outlets
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var textFieldPostalCode: UITextField!
    @IBOutlet weak var mapView: MKMapView!
}
