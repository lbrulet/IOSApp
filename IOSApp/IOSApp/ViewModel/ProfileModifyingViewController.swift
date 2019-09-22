//
//  ProfileModifyingViewController.swift
//  IOSApp
//
//  Created by Adrien Binder on 21/9/19.
//  Copyright © 2019 Luc Brulet. All rights reserved.
//

import UIKit

class ProfileModifyingViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var CircularProfilImage: UIImageView!
    @IBOutlet weak var nameResult: UILabel!
    @IBOutlet weak var ageResult: UILabel!
    @IBOutlet weak var sizeField: UITextField!
    @IBOutlet weak var weightField: UITextField!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var birthDateField: UITextField!
    var imageVc = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.picker.delegate = self
        self.picker.dataSource = self
        
        CircularProfilImage.image = user.getUser().image
        ageResult.text = "I'm " + user.getUser().calculateAge() + " Years old"
        nameResult.text = user.getUser().firstName + " " + user.getUser().lastName
        sizeField.text = String(user.getUser().size)
        weightField.text = String(user.getUser().weight)
        picker.selectRow(Gender.allCases.firstIndex(of: user.getUser().gender)!, inComponent: 0, animated: true)
        birthDateField.text = user.getUser().getBirthDate()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(takingPic))
        CircularProfilImage.clipsToBounds = true
        CircularProfilImage.layer.masksToBounds = true
        CircularProfilImage.layer.cornerRadius = CircularProfilImage.bounds.width / 2
        CircularProfilImage.addGestureRecognizer(tap)
        CircularProfilImage.isUserInteractionEnabled = true
    }
    
    @objc func takingPic() {
        imageVc.sourceType = .camera //replace by .photoLibrary if ran in an emulator
        imageVc.allowsEditing = true
        imageVc.delegate = self
        present(imageVc, animated: true)
    }
    
    @IBAction func saveInfos(_ sender: Any) {
        user.setImage(image: CircularProfilImage.image!)
        user.setSize(size: (Float)(sizeField.text!)!)
        user.setWeight(weight: (Float)(weightField.text!)!)
        user.setGender(gender: Gender.allCases[picker.selectedRow(inComponent: 0)])
        user.setBirthDate(date: birthDateField.text!)
        _ = navigationController?.popToRootViewController(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey :Any]) {
        picker.dismiss(animated: true)
        
        guard let image = info[.editedImage] as? UIImage else {
            print("No image found")
            return
        }
        
        CircularProfilImage.image = image
        print(image.size)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let size = Gender.allCases.count
        return size
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Gender.allCases[row].rawValue
    }

}
