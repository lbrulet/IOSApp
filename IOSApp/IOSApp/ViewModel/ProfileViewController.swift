//
//  ProfileViewController.swift
//  IOSApp
//
//  Created by Adrien Binder on 10/9/19.
//  Copyright © 2019 Luc Brulet. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var CircularProfilImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CircularProfilImage.clipsToBounds = true
        CircularProfilImage.layer.masksToBounds = true
        CircularProfilImage.layer.cornerRadius = CircularProfilImage.bounds.width / 2        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
