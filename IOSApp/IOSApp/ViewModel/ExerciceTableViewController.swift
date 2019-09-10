//
//  ExerciceTableViewController.swift
//  IOSApp
//
//  Created by Luc Brulet on 09/09/2019.
//  Copyright © 2019 Luc Brulet. All rights reserved.
//

import UIKit

class ExerciceTableViewController: UITableViewController {

    var selectedMuscle:(image:UIImage?, label:String, exercices:[Exercice])?
    var exercices:[Exercice] = []
    
    @IBOutlet weak var MuscleImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let selectedMuscle = selectedMuscle{
            exercices = selectedMuscle.exercices
            MuscleImage?.layer.cornerRadius = 20
            MuscleImage.image = selectedMuscle.image
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return exercices.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EXCell", for: indexPath)
        let titleView = cell.viewWithTag(1000) as? UILabel

        if let titleView = titleView {
            let currentExercice = exercices[indexPath.row]
            print(currentExercice.label)
            titleView.text = currentExercice.label
        }
        
        return cell
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}
