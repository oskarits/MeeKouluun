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

class BasicQuestions2: UIViewController, UITextFieldDelegate, CLLocationManagerDelegate {
    var locationManager = CLLocationManager()
    var geoCoder = CLGeocoder()
    private var inputLength: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton?.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "next_map_text", comment: ""), for: .normal)
        // next button disabled on startup
        nextButton.isUserInteractionEnabled = false
        nextButton.alpha = 0.5
        //textFieldPostalCode.delegate = self
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
            
            //finding address given the coordinates
            CLGeocoder().reverseGeocodeLocation(location, completionHandler: {(placemarks, error) -> Void in
                
                if error != nil {
                    print("Reverse geocoder failed with error" + error!.localizedDescription)
                    return
                }
                
                if placemarks!.count > 0 {
                    let pm = placemarks![0]
                    
                    
                    print("postal code is \(pm.postalCode!)") //prints zip code
                    self.textFieldPostalCode.text = String(pm.postalCode!)
                    // activate next button
                    self.activateNext()
                }
                else {
                    print("Problem with the data received from geocoder")
                }
            })
        }
    }
    
    // location failed
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }
    
    // activate next-button
    func activateNext() -> Void {
        self.nextButton.isUserInteractionEnabled = true
        self.nextButton.alpha = 1
    }
    
    // activate next button when 5 number postal code is inputted
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
        textField.becomeFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
        resignFirstResponder()
    }
    
    @IBAction func textFieldEdited(_ sender: UITextField) {
        print("textFieldEdited")
        let userInput: String? = textFieldPostalCode.text
        inputLength = userInput?.count ?? nil
        if (inputLength == 5) {
            self.activateNext()
        }
    }
    // MARK: Outlets
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var textFieldPostalCode: UITextField!
    @IBOutlet weak var mapView: MKMapView!
}
