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
    private var age = 1
//    private var profession: [String] = []
//    private var bmiHistory: [Double] = []
//    private var weight: Double
//    private var height: Double
//    private var latitude: CLLocationDegrees = 60.1
//    private var longitude: CLLocationDegrees = 24.6
//    private var location: CLLocation
    
    /*
    init(name: String, age: Int, weight: Double, height: Double){
        self.name = name
        self.age = (age < 0 ? 0 : age)
        self.weight = (weight < 0 ? 0 : weight)
        self.height = (height < 0 ? 0 : height)
        //self.location  = CLLocation(latitude: latitude, longitude: longitude)
        print("A new person /name has been created!")
    }*/
    
    init(age: Int){
        self.age = (age < 0 ? 0 : age)
        //self.location  = CLLocation(latitude: latitude, longitude: longitude)
        print("A new person /name has been created!")
    }
    
    
    func setAge(newAge: Int) -> Void {
            age = newAge
            print("setAge \(age)")
    }
    
    func getAge() -> Int {
        return self.age
    }
   /*
    func setWeight(newWeight: Double) -> Void {
        if (newWeight > 20){
            weight = newWeight
            print("New weight saved!")
        }else{
            print("Invalid weight! The weight has not been saved!")
        }
    }
    
    func setHeight(newHeight: Double) -> Void {
        if (newHeight > 20){
            height = newHeight
            print("New height saved!")
        }else{
            print("Invalid height! The height has not been saved!")
        }
    }
    
    func newJob(job: String) -> Void {
        if(profession.count == 4){
            print("You have already enough jobs! Please, quit your old job first.")
        }else{
            profession.append(job)
        }
    }
    
//    func setLocation(newLocation: CLLocation) -> Void {
//        self.location = newLocation
//    }
    
    func bmiCalc(inputWeight: Double, inputHeight: Double) -> Double {
        let inputHeightForCalculation = inputHeight / 100.0
        let bmi = (Double(inputWeight)/pow(Double(inputHeightForCalculation), 2))
        print("Your BMI is \(bmi)!")
        bmiHistory.append(bmi)
        return bmi
    }
    
    func getHistory() -> Array<Double> {
        return bmiHistory
    }
    
    */
}

