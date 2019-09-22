//
//  WeightViewController.swift
//  IOSApp
//
//  Created by Luc Brulet on 13/09/2019.
//  Copyright © 2019 Luc Brulet. All rights reserved.
//

import UIKit

class WeightViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var weights:[String] = ["5", "10", "15", "20", "25", "30"]
    var selectedMuscle:(image: UIImage?, exercice: String)?
    let cellSpacingHeight: CGFloat = 20
    private let height: CGFloat = 50.0
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.imageView.layer.cornerRadius = 20
        if let selectedMuscle = selectedMuscle {
            imageView.image = selectedMuscle.image
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return weights.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WGSCell", for: indexPath)
        let label = cell.viewWithTag(1000) as? UILabel
        
        if let label = label {
            let text = weights[indexPath.row] + " kgs"
            label.text = text
            label.layer.masksToBounds = true
            label.layer.cornerRadius = 5
            label.layer.borderWidth = 1
            label.layer.borderColor = UIColor.black.cgColor
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectedMuscle = selectedMuscle {
            user.newRecords(label: selectedMuscle.exercice, weight: Double(weights[indexPath.row])!, color: nil, typeMuscle: nil)
            print(user.getUser().weights[0])
        }
    }
}
