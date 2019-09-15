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
        muscles.append(Muscle(image: "back2", label: "B A C K", exercices: [Exercice(label: "Traction"), Exercice(label: "Pull down")]))
        muscles.append(Muscle(image: "biceps2", label: "B I C E P S", exercices: [Exercice(label: "Curl bar"), Exercice(label: "Curl dumbell")]))
    }

    func getMuscle(byIndex index:Int) -> (image:UIImage?, label:String, exercices:[Exercice]) {
        let image = UIImage(named: muscles[index].image)
        let label = muscles[index].label
        let exercice = muscles[index].exercices

        return (image, label, exercice)
    }
}
