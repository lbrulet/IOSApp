//
//  DateViewController.swift
//  IOSApp
//
//  Created by Luc Brulet on 14/09/2019.
//  Copyright © 2019 Luc Brulet. All rights reserved.
//

import Foundation
import UIKit

struct DateViewController {
    private var date:Date = Date()
    
    func getDate() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMMM d"
        let myEndString = formatter.string(from: date)
        return myEndString
    }
}

