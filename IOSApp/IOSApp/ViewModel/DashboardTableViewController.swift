//
//  DashboardTableViewController.swift
//  IOSApp
//
//  Created by Luc Brulet on 9/9/19.
//  Copyright © 2019 Luc Brulet. All rights reserved.
//

import UIKit

class DashboardTableViewController: UITableViewController {

    private let viewModel = MuscleViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DBCell", for: indexPath)
        let imageView = cell.viewWithTag(1000) as? UIImageView
        let titleView = cell.viewWithTag(1001) as? UILabel
        
        imageView?.layer.cornerRadius = 20
        if let imageView = imageView, let titleView = titleView {
            let currentMuscle = viewModel.getMuscle(byIndex: indexPath.row)
            imageView.image = currentMuscle.image
            titleView.text = currentMuscle.label
	        }
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       guard let selectedRow = self.tableView.indexPathForSelectedRow
        else {return}
    
        let destination = segue.destination as? ExerciceTableViewController
        let selectedMuscle = viewModel.getMuscle(byIndex: selectedRow.row)
        print(selectedMuscle.exercices)
        destination?.selectedMuscle = (image: selectedMuscle.image, label: selectedMuscle.label, exercices: selectedMuscle.exercices)
        
    }
}
