//
//  User.swift
//  IOSApp
//
//  Created by Luc Brulet on 14/09/2019.
//  Copyright © 2019 Luc Brulet. All rights reserved.
//

import Foundation
import UIKit

func archiveWeightCollector(weightCollectorArray : [WeightCollector]) -> Data {
    return try! NSKeyedArchiver.archivedData(withRootObject: weightCollectorArray as Array, requiringSecureCoding: false)
}

func loadWeightCollectorArray(unarchivedObject: Data) -> [WeightCollector] {
    return try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(unarchivedObject) as! [WeightCollector]
}

enum Gender:String, CaseIterable {
    case male = "Male", female = "Female"
    static var allCases: [Gender] = [.male, .female]
}

class WeightCollector: NSObject, NSCoding {
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
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(label, forKey: "Label")
        aCoder.encode(status, forKey: "Status")
        aCoder.encode(color, forKey: "Color")
        aCoder.encode(typeMuscle, forKey: "TypeMuscle")
    }
    
    required init?(coder aDecoder: NSCoder) {
        label = aDecoder.decodeObject(forKey: "Label") as! String
        status = aDecoder.decodeObject(forKey: "Status") as! String
        color = aDecoder.decodeObject(forKey: "Color") as! UIColor
        typeMuscle = aDecoder.decodeObject(forKey: "TypeMuscle") as! String
        weights.append((x: 1, y: 2.0))
    }
    
    func newRecord(weight: Double) {
        weights.append((x: Double(weights.count + 1), y: weight))
    }
}

class User: NSObject, NSCoding {
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
    
    required init(coder aDecoder: NSCoder) {
        self.dateFormatter.dateFormat = "yyyy/MM/dd"
        firstName = aDecoder.decodeObject(forKey: "FirstName") as! String
        lastName = aDecoder.decodeObject(forKey: "LastName") as! String
        image = aDecoder.decodeObject(forKey: "ProfilPicture") as! UIImage
        gender = Gender(rawValue: aDecoder.decodeObject(forKey: "Gender") as! String)!
        weight = aDecoder.decodeFloat(forKey: "Weight")
        size = aDecoder.decodeFloat(forKey: "Size")
        birthDate = aDecoder.decodeObject(forKey: "BirthDate") as! Date
        weights = loadWeightCollectorArray(unarchivedObject: aDecoder.decodeObject(forKey: "Weights") as! Data)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(firstName, forKey: "FirstName")
        aCoder.encode(lastName, forKey: "LastName")
        aCoder.encode(image, forKey: "ProfilPicture")
        aCoder.encode(weight, forKey: "Weight")
        aCoder.encode(size, forKey: "Size")
        aCoder.encode(gender.rawValue, forKey: "Gender")
        aCoder.encode(birthDate, forKey: "BirthDate")
        aCoder.encode(archiveWeightCollector(weightCollectorArray: weights), forKey: "Weights")
        
    }
    
    func newRecords(label: String, weight: Double, color: UIColor?, typeMuscle: String?) {
        var isExist = false;
        print(label)
        for (index, item) in self.weights.enumerated(){
            if (item.label == label) {
                isExist = true
                self.weights[index].newRecord(weight: weight)
                print(self.weights[index].label)
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
    
    func setImage(image: UIImage) {
        self.image = image
    }
    
    func setWeight(weight: Float) {
        self.weight = weight
    }
    
    func setSize(size: Float) {
        self.size = size
    }
    
    func setGender(gender: Gender) {
        self.gender = gender
    }
    
    func setFirstName(firstName: String) {
        self.firstName = firstName
    }
    
    func setLastName(lastName: String) {
        self.lastName = lastName
    }
    
    func setBirthDate(birthDate: String) {
        self.birthDate = self.dateFormatter.date(from: birthDate) ?? dateFormatter.date(from: "1900/01/01")!
    }
}
