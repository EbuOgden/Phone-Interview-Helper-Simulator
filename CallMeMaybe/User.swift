//
//  User.swift
//  CallMeMaybe
//
//  Created by Ebubekir Ogden on 1/16/17.
//  Copyright © 2017 Ebubekir. All rights reserved.
//

import Foundation

class User{
    
    static var sharedInstance = User()
    
    private init(){}
    
    var name: String!
    var surname: String!
    var departmentName: String!
    
    var fullName: String!{
        return "\(name!) \(surname!)"
    }
    
    
    
}
