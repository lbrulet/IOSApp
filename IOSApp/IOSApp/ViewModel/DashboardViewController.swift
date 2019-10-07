//
//  DashboardViewController.swift
//  IOSApp
//
//  Created by Luc Brulet on 14/09/2019.
//  Copyright © 2019 Luc Brulet. All rights reserved.
//

import UIKit
import LocalAuthentication

class DashboardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let viewModel = MuscleViewModel()
    private let dateModel = DateViewController()
    private var userModel = UserViewController()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var dateView: UILabel!

    private let height: CGFloat = 150.0

    func showAlertController(_ message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
        alertController.view.accessibilityIdentifier = "myAlert"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let context = LAContext()
        var error: NSError?
        
        // 2
        // check if Touch ID is available
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // 3
            let reason = "Authenticate with Touch ID"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason, reply:
                {(success, error) in
                    // 4
                    if success {
                        self.showAlertController("Touch ID Authentication Succeeded")
                    }
                    else {
                        self.showAlertController("Touch ID Authentication Failed")
                    }
            })
        }
            // 5
        else {
            showAlertController("Touch ID not available")
        }
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        userImage.image = userModel.getImage()
       
        userImage.layer.cornerRadius = userImage.frame.size.height / 2
        dateView.text = dateModel.getDate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        userImage.image = user.getImage()
        super.viewWillAppear(animated)
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
