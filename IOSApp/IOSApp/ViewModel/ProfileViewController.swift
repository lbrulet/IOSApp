//
//  ProfileViewController.swift
//  IOSApp
//
//  Created by Adrien Binder on 14/9/19.
//  Copyright © 2019 Luc Brulet. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var CircularProfilImage: UIImageView!
    @IBOutlet weak var sizeResult: UILabel!
    @IBOutlet weak var nameResult: UILabel!
    @IBOutlet weak var weightResult: UILabel!
    @IBOutlet weak var genderResult: UILabel!
    @IBOutlet weak var birthDateResult: UILabel!
    @IBOutlet weak var ageResult: UILabel!
    @IBOutlet weak var modifyBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setData()
        CircularProfilImage.clipsToBounds = true
        CircularProfilImage.layer.masksToBounds = true
        CircularProfilImage.layer.cornerRadius = CircularProfilImage.bounds.width / 2
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setData()
        super.viewWillAppear(animated)
    }
    
    func setData() {
        CircularProfilImage.image = user.getUser().image
        ageResult.text = "I'm " + user.getUser().calculateAge() + " Years old"
        sizeResult.text = String(user.getUser().size) + " cm"
        nameResult.text = user.getUser().firstName + " " + user.getUser().lastName
        weightResult.text = String(user.getUser().weight) + " Kg"
        genderResult.text = user.getUser().gender.rawValue
        birthDateResult.text = user.getUser().getBirthDate()
    }

}
