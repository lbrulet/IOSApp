//
//  User.swift
//  IOSApp
//
//  Created by Luc Brulet on 14/09/2019.
//  Copyright © 2019 Luc Brulet. All rights reserved.
//

import Foundation

enum Gender {
    case male, female
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
}
