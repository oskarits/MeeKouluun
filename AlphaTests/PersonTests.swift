//
//  PersonTests.swift
//  AlphaTests
//
//  Created by Oskari Sieranen on 4.12.2019.
//  Copyright © 2019 Jari Pietikäinen. All rights reserved.
//

import Foundation
import XCTest
@testable import Alpha

class PersonTests: XCTestCase {

    var person = Person(age: 21)
    
    
    func testEmailAdd() {
        person.setEmail("asdf@metropolia.fi")
        XCTAssertEqual(person.email, "asdf@metropolia.fi", "email add ok")
    }
    
//    func testAddToArray() {
//        person.addToScore(1, rightValue: 0)
//        XCTAssertTrue(person.quizScore[0] == 1)
//        person.addToScore(1, rightValue: 1)
//        XCTAssertTrue(person.quizScore[0] == 2)
//        XCTAssertTrue(person.quizScore[1] == 1)
//    }
//
    func testCompareArray() {
        // enemy here is extroverted, creative and only a little adventurous
        let enemyScore = [30, 27, 8]
        // person here is introverted, logical and very adventurous
        person.quizScore = [0, 0, 42]
        XCTAssertTrue(person.compareScores(comparisonArray: enemyScore) == 1629.0)
    }
    
    

}
