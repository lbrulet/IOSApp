//
//  WeightTableViewController.swift
//  IOSApp
//
//  Created by Luc Brulet on 10/09/2019.
//  Copyright © 2019 Luc Brulet. All rights reserved.
//

import UIKit

class WeightTableViewController: UITableViewController {

    var weights:[String] = ["5 kgs", "10 kgs", "15 kgs", "20 kgs", "25 kgs", "30 kgs"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return weights.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WGCell", for: indexPath)
        let label = cell.viewWithTag(1000) as? UILabel
        
        if let label = label {
            let text = weights[indexPath.row]
            label.text = text
        }
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }

}
