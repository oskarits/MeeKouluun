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
//    private var latitude: CLLocationDegrees = 60.1
//    private var longitude: CLLocationDegrees = 24.6
//    private var location: CLLocation
    
    /*
    init(name: String, age: Int, weight: Double, height: Double){
        self.name = name
        self.age = (age < 0 ? 0 : age)

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
  
}

