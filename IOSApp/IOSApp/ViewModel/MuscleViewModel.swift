//
//  MuscleViewModel.swift
//  IOSApp
//
//  Created by Luc Brulet on 9/9/19.
//  Copyright © 2019 Luc Brulet. All rights reserved.
//

import Foundation
import UIKit

struct MuscleViewModel {
    private var muscles:[Muscle] = []
    
    var count:Int {
        return muscles.count
    }
    
    func countExercice(index:Int) -> Int {
        return muscles[index].exercices.count
    }
    
    init() {
        populateMuscles()
    }
    	
    private mutating func populateMuscles() {
        muscles.append(Muscle(image: "chest_crop", label: "C H E S T", type: "Chest", exercices: [Exercice(label: "Barbell bench press"), Exercice(label: "Cable Fly"), Exercice(label: "Chest Dips"), Exercice(label: "Declined Barbell Bench Press"), Exercice(label: "Inclined Barbell Bench Press"), Exercice(label: "Dumbell Squeeze Press")]))
        muscles.append(Muscle(image: "biceps2", label: "B I C E P S", type: "Biceps", exercices: [Exercice(label: "Hammer Curl"), Exercice(label: "Ez bar curl"), Exercice(label: "Curl"), Exercice(label: "Pullover"), Exercice(label: "Reverse curl"), Exercice(label: "Close Grip bench press")]))
        muscles.append(Muscle(image: "back2", label: "B A C K", type: "Back", exercices: [Exercice(label: "Traction"), Exercice(label: "Rowing dumbell"), Exercice(label: "Rowing bar"), Exercice(label: "Deadlift"), Exercice(label: "Pull down"), Exercice(label: "Seated cable row")]))
    }

    func getMuscle(byIndex index:Int) -> (image:UIImage?, label:String, exercices:[Exercice]) {
        let image = UIImage(named: muscles[index].image)
        let label = muscles[index].label
        let exercice = muscles[index].exercices

        return (image, label, exercice)
    }
}
