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

public struct UserViewController {
    private var user: User
    
    init() {
        self.user = User(firstName: "Jean", lastName: "Claude Van Damme", image: "user", weight: 82.0, size: 185.5, gender: Gender.male)
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
 
    func getImage() -> UIImage? {
        return UIImage(named: self.user.image)
    }
    
    mutating func setWeight(weight: Float) {
        self.user.setWeight(weight: weight)
    }
    
    mutating func setSize(size: Float) {
        self.user.setSize(size: size)
    }
    
    mutating func setGender(gender: Gender) {
        self.user.setGender(gender: gender)
    }
    
    mutating func setFirstName(firstName: String) {
        self.user.setFirstName(firstName: firstName)
    }
    
    mutating func setLastName(lastName: String) {
        self.user.setLastName(lastName: lastName)
    }
    
    mutating func newRecords(label: String, weight: Double, color: UIColor?, typeMuscle: String?) {
        self.user.newRecords(label: label, weight: weight, color: color, typeMuscle: typeMuscle)
    }
    
    func getUser() -> User {
        return self.user
    }
}
