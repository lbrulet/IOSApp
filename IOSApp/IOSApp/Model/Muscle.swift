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
    var type: String
    var exercices:[Exercice]
    
    init(image:String, label:String, type:String, exercices:[Exercice]) {
        self.image = image
        self.type = type
        self.label = label
        self.exercices = exercices
    }
}
