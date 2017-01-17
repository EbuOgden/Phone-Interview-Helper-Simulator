//
//  FiveEmotionsReport.swift
//  CallMeMaybe
//
//  Created by Ebubekir Ogden on 1/16/17.
//  Copyright © 2017 Ebubekir. All rights reserved.
//

import Foundation

class FiveEmotionsReport{
    
    private var _id: String!
    private var _name: String!
    private var _score: Float!
    
    var id: String {
        if self._id == nil {
            self._id = ""
        }
        
        return self._id
    }
    
    var name: String {
        if self._name == nil {
            self._name = ""
        }
        
        return self._name
    }
    
    var score: Float {
        if self._score == nil {
            self._score = 0.0
        }
        
        return self._score
    }
    
    init(fiveId: String, fiveName: String, fiveScore: Float){
        self._id = fiveId
        self._name = fiveName
        self._score = fiveScore
    }

    
}
