//
//  AlertFunction.swift
//  CallMeMaybe
//
//  Created by Ebubekir Ogden on 1/16/17.
//  Copyright © 2017 Ebubekir. All rights reserved.
//

import UIKit

extension UIViewController {
    func doAlert(title: String, message: String, buttonText: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: buttonText, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

