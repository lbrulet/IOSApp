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
