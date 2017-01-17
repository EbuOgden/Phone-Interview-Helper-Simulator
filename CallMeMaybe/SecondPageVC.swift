//
//  SecondPageVC.swift
//  CallMeMaybe
//
//  Created by Ebubekir Ogden on 1/16/17.
//  Copyright © 2017 Ebubekir. All rights reserved.
//

import UIKit

class SecondPageVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var surnameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        surnameTextField.delegate = self
        surnameTextField.returnKeyType = .done
        
        self.hideKeyboardWhenTappedAround()
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        surnameTextField.resignFirstResponder()
        
        if surnameTextField.text! == ""{
            self.doAlert(title: "Warning", message: "Please Enter a Surname", buttonText: "Okey")
        }
        else{
            User.sharedInstance.surname = surnameTextField.text!
            performSegue(withIdentifier: "toThirdPage", sender: nil)
        }
        
        return true
    }
    
    @IBAction func backPress(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func nextButton(_ sender: UIButton) {
        if surnameTextField.text! == ""{
            self.doAlert(title: "Warning", message: "Please Enter a Surame", buttonText: "Okey")
        }
        else{
            User.sharedInstance.surname = surnameTextField.text!
            performSegue(withIdentifier: "toThirdPage", sender: nil)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
