//
//  User.swift
//  IOSApp
//
//  Created by Luc Brulet on 14/09/2019.
//  Copyright © 2019 Luc Brulet. All rights reserved.
//

import Foundation
import UIKit

enum Gender:String {
    case male = "Male", female = "Female"
}

struct WeightCollector {
    var label:String
    var status:String
    var color:UIColor
    var typeMuscle:String
    var weights:[(x: Double, y: Double)] = []
    
    init(label: String, weight: Double, color: UIColor, typeMuscle: String) {
        self.label = label
        self.status = STATUS_ON
        self.weights.append((x: 1, y: weight))
        self.color = color
        self.typeMuscle = typeMuscle
    }
    
    mutating func newRecord(weight: Double) {
        weights.append((x: Double(weights.count + 1), y: weight))
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
    
    mutating func newRecords(label: String, weight: Double, color: UIColor?, typeMuscle: String?) {
        var isExist = false;
        for (index, item) in self.weights.enumerated(){
            if (item.label == label) {
                isExist = true
                self.weights[index].newRecord(weight: weight)
            }
        }
        if (!isExist) {
            if let color = color, let typeMuscle = typeMuscle {
                self.weights.append(WeightCollector(label: label, weight: weight, color: color, typeMuscle: typeMuscle))
            }
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
