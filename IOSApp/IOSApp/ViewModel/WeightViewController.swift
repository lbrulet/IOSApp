//
//  WeightViewController.swift
//  IOSApp
//
//  Created by Luc Brulet on 13/09/2019.
//  Copyright © 2019 Luc Brulet. All rights reserved.
//

import UIKit

class WeightViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var weights:[String] = ["5 kgs", "10 kgs", "15 kgs", "20 kgs", "25 kgs", "30 kgs"]
    var selectedMuscle:UIImage?
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
            imageView.image = selectedMuscle
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return weights.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WGSCell", for: indexPath)
        let label = cell.viewWithTag(1000) as? UILabel
        
        cell.contentView.layoutMargins.bottom = 10
        if let label = label {
            let text = weights[indexPath.row]
            label.text = text
            cell.layer.masksToBounds = true
            cell.layer.cornerRadius = 20
            cell.layer.borderWidth = 1
            cell.layer.borderColor = UIColor.black.cgColor
        }
        return cell
    }    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
