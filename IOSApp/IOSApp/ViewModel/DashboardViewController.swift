//
//  DashboardViewController.swift
//  IOSApp
//
//  Created by Luc Brulet on 14/09/2019.
//  Copyright © 2019 Luc Brulet. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let viewModel = MuscleViewModel()
    private let dateModel = DateViewController()
    private var userModel = UserViewController()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var dateView: UILabel!

    private let height: CGFloat = 150.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        userImage.image = userModel.getImage()
       
        userImage.layer.cornerRadius = userImage.frame.size.height / 2
        dateView.text = dateModel.getDate()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return self.height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
        let backItem = UIBarButtonItem()
        backItem.title = "Today"
        navigationItem.backBarButtonItem = backItem
        let destination = segue.destination as? ExcericeViewController
        let selectedMuscle = viewModel.getMuscle(byIndex: selectedRow.row)
        destination?.selectedMuscle = (image: selectedMuscle.image, label: selectedMuscle.label, exercices: selectedMuscle.exercices)
        
    }
}
