//
//  Report.swift
//  CallMeMaybe
//
//  Created by Ebubekir Ogden on 1/16/17.
//  Copyright © 2017 Ebubekir. All rights reserved.
//

import Foundation

class EmotionalToneReport {
    
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
    
    init(emotionId: String, emotionName: String, emotionScore: Float){
        self._id = emotionId
        self._name = emotionName
        self._score = emotionScore
    }
    
}
