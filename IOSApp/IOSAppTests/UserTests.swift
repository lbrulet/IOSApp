//
//  UserTests.swift
//  IOSAppTests
//
//  Created by Luc Brulet on 15/09/2019.
//  Copyright © 2019 Luc Brulet. All rights reserved.
//

import Foundation
import XCTest
@testable import IOSApp

class UserTests: XCTestCase {
    
    func testUserValid() {
        let user = User(firstName: "Jean Claude", lastName: "Van Damme", image: "user", weight: 82.0, size: 185.5, gender: Gender.male)
        
        XCTAssertEqual("Jean Claude", user.firstName)
        XCTAssertEqual("Van Damme", user.lastName)
        XCTAssertEqual("user", user.image)
        XCTAssertEqual(82.0, user.weight)
        XCTAssertEqual(185.5, user.size)
        XCTAssertEqual(Gender.male, user.gender)
    }
    
    func testUserIsNotValid() {
        let user = User(firstName: "Jean", lastName: "Van Damme", image: "user", weight: 82.0, size: 185.5, gender: Gender.male)
        
        XCTAssertNotEqual("Luc", user.firstName)
        XCTAssertNotEqual("Brulet Damme", user.lastName)
        XCTAssertNotEqual("back2", user.image)
        XCTAssertNotEqual(82.5, user.weight)
        XCTAssertNotEqual(185.2, user.size)
        XCTAssertNotEqual(Gender.female, user.gender)
    }
    
    func testUserSetWidth() {
        var user = User(firstName: "Jean Claude", lastName: "Van Damme", image: "user", weight: 82.0, size: 185.5, gender: Gender.male)
        
        XCTAssertEqual(82.0, user.weight)
        user.setWeight(weight: 90.0)
        XCTAssertEqual(90.0, user.weight)
    }
    
    func testUserSetWidthFail() {
        var user = User(firstName: "Jean Claude", lastName: "Van Damme", image: "user", weight: 82.0, size: 185.5, gender: Gender.male)
        
        XCTAssertEqual(82.0, user.weight)
        user.setWeight(weight: 90.0)
        XCTAssertNotEqual(82.0, user.weight)
    }
    
    func testUserSetSize() {
        var user = User(firstName: "Jean Claude", lastName: "Van Damme", image: "user", weight: 82.0, size: 185.5, gender: Gender.male)
        
        XCTAssertEqual(185.5, user.size)
        user.setSize(size: 190.0)
        XCTAssertEqual(190.0, user.size)
    }
    
    func testUserSetSizeFail() {
        var user = User(firstName: "Jean Claude", lastName: "Van Damme", image: "user", weight: 82.0, size: 185.5, gender: Gender.male)
        
        XCTAssertEqual(185.5, user.size)
        user.setSize(size: 190.0)
        XCTAssertNotEqual(185.5, user.size)
    }
    
}
