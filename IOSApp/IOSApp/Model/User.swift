//
//  User.swift
//  IOSApp
//
//  Created by Luc Brulet on 14/09/2019.
//  Copyright © 2019 Luc Brulet. All rights reserved.
//

import Foundation

enum Gender:String {
    case male = "Male", female = "Female"
}

struct User {
    var image:String
    var firstName:String
    var lastName:String
    var weight:Float
    var size:Float
    var gender:Gender
    
    init(firstName: String, lastName: String, image: String, weight: Float, size: Float, gender: Gender) {
        self.firstName = firstName
        self.lastName = lastName
        self.image = image
        self.weight = weight
        self.size = size
        self.gender = gender
    }
    
    mutating func setWeight(weight: Float) {
        self.weight = weight
    }
    
    mutating func setSize(size: Float) {
        self.size = size
    }
    
    mutating func setGender(gender: Gender) {
        self.gender = gender
    }
    
    mutating func setFirstName(firstName: String) {
        self.firstName = firstName
    }
    
    mutating func setLastName(lastName: String) {
        self.lastName = lastName
    }
}
