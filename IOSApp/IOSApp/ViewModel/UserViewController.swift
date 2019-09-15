//
//  UserViewController.swift
//  IOSApp
//
//  Created by Luc Brulet on 14/09/2019.
//  Copyright © 2019 Luc Brulet. All rights reserved.
//

import Foundation
import UIKit

struct UserViewController {
    private var user: User
    
    init() {
        self.user = User(firstName: "Jean", lastName: "Claude Van Damme", image: "user", weight: 82.0, size: 185.5, gender: Gender.male)
    }
    
    func getImage() -> UIImage? {
        return UIImage(named: self.user.image)
    }
    
    func getUser() -> User {
        return self.user
    }
}
