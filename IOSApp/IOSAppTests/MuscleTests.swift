//
//  MuscleTests.swift
//  IOSAppTests
//
//  Created by Luc Brulet on 15/09/2019.
//  Copyright © 2019 Luc Brulet. All rights reserved.
//

import Foundation
import XCTest
@testable import IOSApp

class MuscleTests: XCTestCase {
    
    func testMuscleValid() {
        let muscle = Muscle(image: "back2", label: "B A C K", type: "Back", exercices: [Exercice(label: "Traction"), Exercice(label: "Pull down")])
        
        XCTAssertEqual("B A C K", muscle.label)
        XCTAssertEqual("back2", muscle.image)
        XCTAssertEqual(2, muscle.exercices.count)
    }
    
    func testMuscleFail() {
        let muscle = Muscle(image: "back2", label: "B A C K",type: "Back", exercices: [Exercice(label: "Traction"), Exercice(label: "Pull down")])
        
        XCTAssertNotEqual("B I C E P S", muscle.label)
        XCTAssertNotEqual("biceps2", muscle.image)
        XCTAssertNotEqual(3, muscle.exercices.count)
    }
}
