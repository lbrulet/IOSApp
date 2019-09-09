//
//  MusclesModel.swift
//  IOSApp
//
//  Created by Luc Brulet on 9/9/19.
//  Copyright © 2019 Luc Brulet. All rights reserved.
//

import Foundation

struct Muscle {
    var image:String
    var label:String

    init(image:String, label:String) {
        self.image = image
        self.label = label
    }
}

struct Muscles {
    private var muscles:[Muscle] = []
    private var currentImage:Int = 0
    
    init() {
        populateMuscles()
    }
    
    private mutating func populateMuscles() {
        muscles.append(Muscle(image: "back2", label: "B A C K"))
        muscles.append(Muscle(image: "biceps2", label: "B I C E P S"))
    }
    
    public mutating func getNextMuscle() -> Muscle {
        if currentImage == 1 {currentImage = 0}
        else {currentImage += 1}
        return muscles[currentImage]
    }
    
}
