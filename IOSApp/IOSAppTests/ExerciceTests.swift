//
//  ExerciceTests.swift
//  IOSAppTests
//
//  Created by Luc Brulet on 15/09/2019.
//  Copyright © 2019 Luc Brulet. All rights reserved.
//

import Foundation
import XCTest
@testable import IOSApp

class ExerciceTests: XCTestCase {
    
    func testExerciceValid() {
        let exercice = Exercice(label: "Curl dumbell")
        
        XCTAssertEqual("Curl dumbell", exercice.label)
    }
    
    func testExerciceFail() {
        let exercice = Exercice(label: "Curl dumbell")
        
        XCTAssertNotEqual("Pull down", exercice.label)
    }
}
