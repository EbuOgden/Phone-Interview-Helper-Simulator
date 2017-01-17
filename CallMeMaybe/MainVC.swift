//
//  ViewController.swift
//  CallMeMaybe
//
//  Created by Ebubekir Ogden on 1/15/17.
//  Copyright © 2017 Ebubekir. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        nameTextField.returnKeyType = .done
        
        self.hideKeyboardWhenTappedAround()
        
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        
        if nameTextField.text == ""{
            self.doAlert(title: "Warning", message: "Please Enter a Name", buttonText: "Okey")
        }
        else{
            User.sharedInstance.name = nameTextField.text!
            performSegue(withIdentifier: "toSecondPage", sender: nil)
        }
        
        return true
    }
    
    
    @IBAction func nextButton(_ sender: UIButton) {
        
        if nameTextField.text == "" {
            self.doAlert(title: "Warning", message: "Please Enter a Name", buttonText: "Okey")
        }
        else{
            User.sharedInstance.name = nameTextField.text!
            performSegue(withIdentifier: "toSecondPage", sender: nil)
        }
    }
}

