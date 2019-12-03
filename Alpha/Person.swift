//
//  Person.swift
//  meekouluun
//
//  Created by Otto on 18/11/2019.
//  Copyright © 2019 iosdev. All rights reserved.
//

import Foundation
import CoreLocation

class Person {
   // private let name: String
    private(set) var age = 1
//    private var profession: [String] = []
//    private var latitude: CLLocationDegrees = 60.1
//    private var longitude: CLLocationDegrees = 24.6
//    private var location: CLLocation
    private(set) var email = ""
    // First iteration is a 2 score system where the first space is reserved for STEM-related points
    // And the second one for everything else
    private(set) var quizScore = [0, 0]

    /*
    init(name: String, age: Int, weight: Double, height: Double){
        self.name = name
        self.age = (age < 0 ? 0 : age)

        self.location  = CLLocation(latitude: latitude, longitude: longitude)
        print("A new person /name has been created!")
    }*/
    
    init(email: String) {
        // self.age = (age < 0 ? 0 : age)
        // self.location  = CLLocation(latitude: latitude, longitude: longitude)
        self.email = email
        print("A new person /name has been created!")
    }

    func setAge(newAge: Int) -> Void {
            age = newAge
            print("setAge \(age)")
    }
    
    func addToScore(_ brain: Int) -> Void {
        if brain > 1 {
            NSLog("No such score...yet")
        } else {
            quizScore[brain] = quizScore[brain] + 1
        }
    }
}

