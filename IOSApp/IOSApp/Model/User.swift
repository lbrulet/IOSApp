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

struct WeightCollector {
    var label:String
    var weights:[Int] = [0]
    
    init(label: String, weight: Int) {
        self.label = label
        self.weights.append(weight)
    }
    
    mutating func newRecord(weight: Int) {
        weights.append(weight)
    }
}

struct User {
    var image:String
    var firstName:String
    var lastName:String
    var weight:Float
    var size:Float
    var gender:Gender
    var weights:[WeightCollector] = []
    
    init(firstName: String, lastName: String, image: String, weight: Float, size: Float, gender: Gender) {
        self.firstName = firstName
        self.lastName = lastName
        self.image = image
        self.weight = weight
        self.size = size
        self.gender = gender
    }
    
    mutating func newRecords(label: String, weight: Int) {
        var isExist = false;
        for (index, item) in self.weights.enumerated(){
            if (item.label == label) {
                isExist = true
                self.weights[index].newRecord(weight: weight)
            }
        }
        if (!isExist) {
            self.weights.append(WeightCollector(label: label, weight: weight))
        }
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
