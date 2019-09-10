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
    
    init() {
        populateMuscles()
    }
    
    private mutating func populateMuscles() {
        muscles.append(Muscle(image: "back2", label: "B A C K"))
        muscles.append(Muscle(image: "biceps2", label: "B I C E P S"))
    }

    func getMuscle(byIndex index:Int) -> (image:UIImage?, label:String) {
        let image = UIImage(named: muscles[index].image)
        let label = muscles[index].label
        
        return (image, label)
    }
}
