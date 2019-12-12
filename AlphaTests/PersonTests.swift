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


    
    func testEmailAdd() {
        personInstance.setEmail("asdf@metropolia.fi")
        XCTAssertEqual(personInstance.email, "asdf@metropolia.fi", "email add ok")
    }

    func testAddToArray() {
        personInstance.addToScore(1, 0)
        XCTAssertTrue(personInstance.quizScore[0] == 1)
        personInstance.addToScore(1, 1)
        XCTAssertTrue(personInstance.quizScore[0] == 2)
        XCTAssertTrue(personInstance.quizScore[1] == 1)
    }

    func testCompareArray() {
        let enemyScore = [3, 7, 8]
        personInstance.quizScore = [0, 0, 4]
        print("test score \(personInstance.compareScores(comparisonArray: enemyScore))")
        XCTAssertTrue(personInstance.compareScores(comparisonArray: enemyScore) == 74.0)
    }
    
    func testPerfectScore() {
        let goodScore = [2, 8, 0]
        personInstance.quizScore = [2, 8, 0]
        XCTAssertTrue(personInstance.compareScores(comparisonArray: goodScore) == 0.0)
    }
}
