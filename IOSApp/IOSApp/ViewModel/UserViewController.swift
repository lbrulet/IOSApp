//
//  UserViewController.swift
//  IOSApp
//
//  Created by Luc Brulet on 14/09/2019.
//  Copyright © 2019 Luc Brulet. All rights reserved.
//

import Foundation
import UIKit

public struct UserViewController {
    private var user: User
    
    init() {
        self.user = User(firstName: "Jean", lastName: "Claude Van Damme", image: "user", weight: 82.0, size: 185.5, gender: Gender.male)
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
    
    mutating func newRecords(label: String, weight: Int) {
        self.user.newRecords(label: label, weight: weight)
    }
    
    func getUser() -> User {
        return self.user
    }
}
