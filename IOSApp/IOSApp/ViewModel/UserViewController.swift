//
//  UserViewController.swift
//  IOSApp
//
//  Created by Luc Brulet on 14/09/2019.
//  Copyright © 2019 Luc Brulet. All rights reserved.
//

import Foundation
import UIKit
import SwiftChart
import Nikka

struct MuscleItem: Decodable {
    var id: Int
    var name: String
}

struct MuscleAPI: Decodable {
    var count: Int
    var results: [MuscleItem]
}

public struct UserViewController {
    private var user: User
    private var userDefault: UserDefaults
    
    init() {
        self.userDefault = UserDefaults.standard
        
        MyProvider().request(Route(path:"/exercisecategory")).responseObject {( response:Response<MuscleAPI> ) in
            let res = response.result.value
            var list:[String] = []
            switch response.result{
            case .success(_):
                if let muscle = res {
                    for item in muscle.results {
                        switch item.name {
                        case "Back":
                            list.append(item.name)
                        case "Chest":
                            list.append(item.name)
                        case "Arms":
                            list.append(item.name)
                        default:
                            print("nothing")
                        }
                    }
                }
            case .failure(let error):
                print("error: \(error)")
            }
        }

	if self.userDefault.object(forKey: "User") != nil
        {
            let data = NSData(data: self.userDefault.object(forKey: "User") as! Data)
            do {
                self.user = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(Data(referencing: data)) as! User
                } catch {
	          self.user = User(firstName: "Jean", lastName: "Claude Van Damme", image: "user", weight: 82.0, size: 185.5, gender: Gender.male, birthDate: "1997/05/08")

        	  self.user.newRecords(label: "Barbell bench press", weight: 0, color: COLOR_PINK, typeMuscle: "Chest")
        	  self.user.newRecords(label: "Cable Fly", weight: 0, color: COLOR_RED, typeMuscle: "Chest")
        	  self.user.newRecords(label: "Chest Dips", weight: 0, color: COLOR_BLUE, typeMuscle: "Chest")
        	  self.user.newRecords(label: "Declined Barbell Bench Press", weight: 0, color: COLOR_GREEN, typeMuscle: "Chest")
        	  self.user.newRecords(label: "Inclined Barbell Bench Press", weight: 0, color: COLOR_ORANGE, typeMuscle: "Chest")
        	  self.user.newRecords(label: "Dumbell Squeeze Press", weight: 0, color: COLOR_PURPLE, typeMuscle: "Chest")
        
		  self.user.newRecords(label: "Hammer curl", weight: 0, color: COLOR_PINK, typeMuscle: "Biceps")
       		  self.user.newRecords(label: "Ez bar curl", weight: 0, color: COLOR_RED, typeMuscle: "Biceps")
        	  self.user.newRecords(label: "Curl", weight: 0, color: COLOR_BLUE, typeMuscle: "Biceps")
        	  self.user.newRecords(label: "Pullover", weight: 0, color: COLOR_GREEN, typeMuscle: "Biceps")
        	  self.user.newRecords(label: "Close Grip Bench Press", weight: 0, color: COLOR_ORANGE, typeMuscle: "Biceps")
        	  self.user.newRecords(label: "Reverse curl", weight: 0, color: COLOR_PURPLE, typeMuscle: "Biceps")
        
		  self.user.newRecords(label: "Traction", weight: 0, color: COLOR_PINK, typeMuscle: "Back")
        	  self.user.newRecords(label: "Rowing dumbell", weight: 0, color: COLOR_RED, typeMuscle: "Back")
        	  self.user.newRecords(label: "Rowing bar", weight: 0, color: COLOR_BLUE, typeMuscle: "Back")
        	  self.user.newRecords(label: "Deadlift", weight: 0, color: COLOR_GREEN, typeMuscle: "Back")
        	  self.user.newRecords(label: "Pull down", weight: 0, color: COLOR_ORANGE, typeMuscle: "Back")
        	  self.user.newRecords(label: "Seated cable row", weight: 0, color: COLOR_PURPLE, typeMuscle: "Back")
                  selfStore()
            }
        }
        else
        {
	        self.user = User(firstName: "Jean", lastName: "Claude Van Damme", image: "user", weight: 82.0, size: 185.5, gender: Gender.male, birthDate: "1997/05/08")

        	self.user.newRecords(label: "Barbell bench press", weight: 0, color: COLOR_PINK, typeMuscle: "Chest")
		self.user.newRecords(label: "Cable Fly", weight: 0, color: COLOR_RED, typeMuscle: "Chest")
        	self.user.newRecords(label: "Chest Dips", weight: 0, color: COLOR_BLUE, typeMuscle: "Chest")
        	self.user.newRecords(label: "Declined Barbell Bench Press", weight: 0, color: COLOR_GREEN, typeMuscle: "Chest")
        	self.user.newRecords(label: "Inclined Barbell Bench Press", weight: 0, color: COLOR_ORANGE, typeMuscle: "Chest")
        	self.user.newRecords(label: "Dumbell Squeeze Press", weight: 0, color: COLOR_PURPLE, typeMuscle: "Chest")
        
		self.user.newRecords(label: "Hammer curl", weight: 0, color: COLOR_PINK, typeMuscle: "Biceps")
        	self.user.newRecords(label: "Ez bar curl", weight: 0, color: COLOR_RED, typeMuscle: "Biceps")
        	self.user.newRecords(label: "Curl", weight: 0, color: COLOR_BLUE, typeMuscle: "Biceps")
        	self.user.newRecords(label: "Pullover", weight: 0, color: COLOR_GREEN, typeMuscle: "Biceps")
        	self.user.newRecords(label: "Close Grip Bench Press", weight: 0, color: COLOR_ORANGE, typeMuscle: "Biceps")
        	self.user.newRecords(label: "Reverse curl", weight: 0, color: COLOR_PURPLE, typeMuscle: "Biceps")
        
		self.user.newRecords(label: "Traction", weight: 0, color: COLOR_PINK, typeMuscle: "Back")
        	self.user.newRecords(label: "Rowing dumbell", weight: 0, color: COLOR_RED, typeMuscle: "Back")
        	self.user.newRecords(label: "Rowing bar", weight: 0, color: COLOR_BLUE, typeMuscle: "Back")
        	self.user.newRecords(label: "Deadlift", weight: 0, color: COLOR_GREEN, typeMuscle: "Back")
        	self.user.newRecords(label: "Pull down", weight: 0, color: COLOR_ORANGE, typeMuscle: "Back")
        	self.user.newRecords(label: "Seated cable row", weight: 0, color: COLOR_PURPLE, typeMuscle: "Back")
        	selfStore()
        }
    }
    
    func getMuscleDataChart(typeMuscle: String) -> DataChartSeries {
        var dataset:[(String, ChartSeries, String, UIColor)] = []
        for weightCollector in self.user.weights {
            if (weightCollector.typeMuscle == typeMuscle) {
                let chart = ChartSeries(data: weightCollector.weights)
                chart.area = true
                chart.color = weightCollector.color
                dataset.append((weightCollector.status, chart, weightCollector.label, weightCollector.color))
            }
        }
        return DataChartSeries(dataSet: dataset)
    }
    
    func getListMuscle(typeMuscle: String) -> [WeightCollector] {
        var data:[WeightCollector] = []
        for weightCollector in self.user.weights {
            if (weightCollector.typeMuscle == typeMuscle) {
                    data.append(weightCollector)
            }
        }
        return data
    }
    
    mutating func selfStore() {
        do {
            self.userDefault.setValue(try NSKeyedArchiver.archivedData(withRootObject: self.user, requiringSecureCoding: false), forKey: "User")
        } catch {
            print("Error while storing")
        }
    }
 
    func getImage() -> UIImage? {
        return self.user.image
    }
    
    mutating func setImage(image: UIImage) {
        self.user.setImage(image: image)
        selfStore()
    }
    
    mutating func setWeight(weight: Float) {
        self.user.setWeight(weight: weight)
        selfStore()
    }
    
    mutating func setSize(size: Float) {
        self.user.setSize(size: size)
        selfStore()
    }
    
    mutating func setGender(gender: Gender) {
        self.user.setGender(gender: gender)
        selfStore()
    }
    
    mutating func setBirthDate(date:String) {
        self.user.setBirthDate(birthDate: date)
        selfStore()
    }
    
    mutating func setFirstName(firstName: String) {
        self.user.setFirstName(firstName: firstName)
        selfStore()
    }
    
    mutating func setLastName(lastName: String) {
        self.user.setLastName(lastName: lastName)
        selfStore()
    }
    
    mutating func newRecords(label: String, weight: Double, color: UIColor?, typeMuscle: String?) {
        self.user.newRecords(label: label, weight: weight, color: color, typeMuscle: typeMuscle)
        selfStore()
    }
    
    mutating func getUser() -> User {
        return self.user
    }
}
