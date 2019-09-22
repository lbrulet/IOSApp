//
//  User.swift
//  IOSApp
//
//  Created by Luc Brulet on 14/09/2019.
//  Copyright © 2019 Luc Brulet. All rights reserved.
//

import Foundation
import UIKit

enum Gender:String, CaseIterable {
    case male = "Male", female = "Female"
    static var allCases: [Gender] = [.male, .female]
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
    var image:UIImage
    var firstName:String
    var lastName:String
    var weight:Float
    var size:Float
    var gender:Gender
    var weights:[WeightCollector] = []
    var birthDate:Date
    var dateFormatter:DateFormatter = DateFormatter()
    
    init(firstName: String, lastName: String, image: String, weight: Float, size: Float, gender: Gender, birthDate: String) {
        self.dateFormatter.dateFormat = "yyyy/MM/dd"
        self.firstName = firstName
        self.lastName = lastName
        self.image = UIImage(named: image)!
        self.weight = weight
        self.size = size
        self.gender = gender
        self.birthDate = self.dateFormatter.date(from: birthDate)!
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
    
    func getBirthDate() -> String {
        return self.dateFormatter.string(from: self.birthDate)
    }
    
    func calculateAge() -> String {
        let now = Date()
        let birthday: Date = self.birthDate
        let calendar = Calendar.current
        
        let ageComponents = calendar.dateComponents([.year], from: birthday, to: now)
        let age = ageComponents.year!
        return String(age)
    }
    
    mutating func setImage(image: UIImage) {
        self.image = image
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
    
    mutating func setBirthDate(birthDate: String) {
        self.birthDate = self.dateFormatter.date(from: birthDate)!
    }
}
