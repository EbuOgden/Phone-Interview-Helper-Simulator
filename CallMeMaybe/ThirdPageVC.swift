//
//  ThirdPageVC.swift
//  CallMeMaybe
//
//  Created by Ebubekir Ogden on 1/16/17.
//  Copyright © 2017 Ebubekir. All rights reserved.
//

import UIKit

class ThirdPageVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var departmentnameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        departmentnameTextField.delegate = self
        departmentnameTextField.returnKeyType = .done
        
        
        self.hideKeyboardWhenTappedAround()
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        departmentnameTextField.resignFirstResponder()
        
        if departmentnameTextField.text! == "" {
            self.doAlert(title: "Warning", message: "Please Enter a Departmant Name", buttonText: "Okey")
        }
        else{
            User.sharedInstance.departmentName = departmentnameTextField.text!
            performSegue(withIdentifier: "toCallMeMaybe", sender: "")
        }
        
        return true
    }
    
    @IBAction func backPress(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func callMe(_ sender: UIButton) {
        if departmentnameTextField.text! == "" {
            self.doAlert(title: "Warning", message: "Please Enter a Departmant Name", buttonText: "Okey")
        }
        else{
            User.sharedInstance.departmentName = departmentnameTextField.text!
            performSegue(withIdentifier: "toCallMeMaybe", sender: "")
        }

    }
}
