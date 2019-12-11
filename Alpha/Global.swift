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

class Main {
    public var fullName: String?
    private(set) var age = 1
//    private var profession: [String] = []
//    private var latitude: CLLocationDegrees = 60.1
//    private var longitude: CLLocationDegrees = 24.6
//    private var location: CLLocation
    private(set) var email = ""
    // set to private(set)
    // This version has three axels: Introverted v Extroverted, Creative v Logical and Adventurous v Steady work environment
    public var quizScore = [0, 0, 0]
    private var location: String?

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
    
    func setName(newName: String) -> Void {
        fullName = newName
    }

    
    func setEmail(_ newEmail: String) -> Void {
        email = newEmail
        print("Person.setEmail: \(email)")
    }
    
    func setAge(newAge: Int) -> Void {
            age = newAge
        print("Person.setAge: \(age)")
    }
    
    func setLocation(newLocation: String) -> Void {
        location = newLocation
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
    func addToScore(_ IvE: Int = 0, _ CvL: Int = 0, _ SvA: Int = 0) {
        quizScore[0] = ((quizScore[0] + IvE)%10)
        quizScore[1] = ((quizScore[1] + CvL)%10)
        quizScore[2] = ((quizScore[2] + SvA)%10)
        print("QuizScore \((quizScore[0], quizScore[1], quizScore[2]))")
    }
    // Compares two scores, one for the person and one for the school
    func compareScores(comparisonArray: [Int]) -> Double {
        if comparisonArray.count != 3 {
            return 0.0
        }
        let result = pow(Double(comparisonArray[0]) - Double(quizScore[0]), 2) + pow(Double(comparisonArray[1]) - Double(quizScore[1]), 2)
        return result
        
    }
}

var personInstance = Main(age: 15)
