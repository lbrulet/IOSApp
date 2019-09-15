//
//  ExcericeViewController.swift
//  IOSApp
//
//  Created by Luc Brulet on 14/09/2019.
//  Copyright © 2019 Luc Brulet. All rights reserved.
//

import UIKit

class ExcericeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var selectedMuscle:(image:UIImage?, label:String, exercices:[Exercice])?
    var exercices:[Exercice] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var MuscleImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        if let selectedMuscle = selectedMuscle{
            exercices = selectedMuscle.exercices
            MuscleImage?.layer.cornerRadius = 20
            MuscleImage.image = selectedMuscle.image
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
        let backItem = UIBarButtonItem()
        backItem.title = "Choose your exercice"
        navigationItem.backBarButtonItem = backItem
        let destination = segue.destination as? WeightViewController
        destination?.selectedMuscle = selectedMuscle?.image
    }
}
