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

// Class to ask for user's location
class BasicQuestions2: UIViewController, UITextFieldDelegate, CLLocationManagerDelegate {
    var locationManager = CLLocationManager()
    var geoCoder = CLGeocoder()
    private var inputLength: Int?
    // Creates a gradient layer
    let layer = CAGradientLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Setting bounds and color for gradient layer
        layer.frame = view.bounds
        let color2 = UIColor(red: 0.08, green: 0.11, blue: 0.15, alpha: 1)
        let color1 = UIColor(red: 0.19, green: 0.27, blue: 0.37, alpha: 1)
        layer.colors = [color1.cgColor, color2.cgColor]
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x:1, y:1)
        // Inserts gradient layer to the background
        view.layer.insertSublayer(layer, at: 0)
        // Changest the language of the nextButton text
        nextButton?.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "next_map_text", comment: ""), for: .normal)
        // Next button disabled on startup
        nextButton.isUserInteractionEnabled = false
        nextButton.alpha = 0.5
        nextButton.contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        nextButton.titleLabel?.lineBreakMode = .byWordWrapping
        nextButton.layer.cornerRadius = 17
        nextButton.layer.borderWidth = 1
        // Setup location manager
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        // Ask for location
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        print("Location fetching started...")
        // Changest the language of the postalLabel text
        postalLabel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "postal_code_description", comment: "")
        postalLabel.textColor = .white
        postalLabel.font = UIFont.systemFont(ofSize: 20)
    }
    
    // Succesful location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print("Found user's location: \(location)")
            // Center map according to location
            mapView.centerCoordinate = location.coordinate
            //Finding address given the coordinates
            CLGeocoder().reverseGeocodeLocation(location, completionHandler: {(placemarks, error) -> Void in
                if error != nil {
                    print("Reverse geocoder failed with error" + error!.localizedDescription)
                    return
                }
                if placemarks!.count > 0 {
                    // Get location and postal code
                    let pm = placemarks![0]
                    if let postalCodeString = pm.postalCode {
                        // Save location
                        personInstance.setLocation(newLocation: postalCodeString)
                        self.textFieldPostalCode.text = pm.postalCode
                        // Activate next button
                        self.activateNext()
                    } else {
                        print("Problem with the data received from geocoder, error 1")
                    }
                }
                else {
                    print("Problem with the data received from geocoder, error 2")
                }
            })
        }
    }

    // Location failed
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }
    
    // Activate next-button
    func activateNext() -> Void {
        self.nextButton.isUserInteractionEnabled = true
        self.nextButton.alpha = 1
    }
    
    // Activate next button when 5 number postal code is inputted
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
        textField.becomeFirstResponder()
    }
    
    // Resign texfiel FirstResponder
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
        resignFirstResponder()
    }
    
    // Gives nextButton round corner
    func initButton() -> Void {
        nextButton.layer.cornerRadius = 20
    }
    
    // Checks that use input is correct
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
    @IBOutlet weak var postalLabel: UILabel!
}
