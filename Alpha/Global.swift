//
//  Global.swift
//  meekouluun
//
//  Created by Otto on 18/11/2019.
//  Copyright © 2019 iosdev. All rights reserved.
//

import Foundation
import CoreLocation

class Main {
    public var fullName: String?
    private(set) var age = 1
    private(set) var email = ""
    // This version has three axels: Introverted v Extroverted, Creative v Logical and Adventurous v Steady work environment
    public var quizScore = [0, 0, 0]
    private var location: String?

    init(age: Int) {
        self.age = (age < 0 ? 0 : age)
        print("User created succesfully")
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

    // Hardcoded function for the current algorithm, all scores are modulod to keep in line with current score convetion
    func addToScore(_ IvE: Int = 0, _ CvL: Int = 0, _ SvA: Int = 0) {
        quizScore[0] = ((quizScore[0] + IvE)%10)
        quizScore[1] = ((quizScore[1] + CvL)%10)
        quizScore[2] = ((quizScore[2] + SvA)%10)
        print("QuizScore \((quizScore[0], quizScore[1], quizScore[2]))")
    }
    
    // Compares two scores, one for the person and one for the school
    func compareScores(comparisonArray: [Int]) -> Double {
        var result = 0.0
        if comparisonArray.count != 3 {
            return 0.0
        }
        for i in 0...2 {
            result += pow(Double(comparisonArray[i]) - Double(quizScore[i]) ,2)
        }
        print("score results \(result)")
        return result
    }
}

var personInstance = Main(age: 15)
