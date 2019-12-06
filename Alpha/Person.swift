//
//  Person.swift
//  meekouluun
//
//  Created by Otto on 18/11/2019.
//  Copyright © 2019 iosdev. All rights reserved.
//

import Foundation
import CoreLocation

// TODO
// funcs for: Printing array(?),

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
    // set to private(set)
    public var quizScore = [0, 0]

    /*
    init(name: String, age: Int, weight: Double, height: Double){
        self.name = name
        self.age = (age < 0 ? 0 : age)

        self.location  = CLLocation(latitude: latitude, longitude: longitude)
        print("A new person /name has been created!")
    }*/
    
    init(age: Int) {
        self.age = (age < 0 ? 0 : age)
        // self.location  = CLLocation(latitude: latitude, longitude: longitude)
        print("A new person /name has been created!")
    }

    
    func setEmail(_ newEmail: String) {
        email = newEmail
    }
    
    func setAge(newAge: Int) {
            age = newAge
            print("setAge \(age)")
    }

    // Allows adding to whole array at once in order
    // Fix for loop to
//    func addToScore(scores: Int...) {
//        for place in quizScore {
//            print("asdf " + String(place))
//            quizScore[place] = quizScore[place] + scores[place]
//        }
//
//    }
    func addToScore(_ leftValue: Int, rightValue: Int) {
        quizScore[0] = quizScore[0] + leftValue
        quizScore[1] = quizScore[1] + rightValue
    }
    
    // TODO Move to tests
    private var testingScore = [0, 12] // Lähihoitaja
    private var qScore = [8, 3] // Test userscore
    
    func compareScores(comparisonArray: [Int]) -> Double {
        let result = pow(Double(testingScore[0]) - Double(qScore[0]), 2) + pow(Double(testingScore[1]) - Double(qScore[1]), 2)
        return result
    }
}

