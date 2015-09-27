//
//  History.swift
//  MyoFitness
//
//  Created by Thanh Tran on 9/26/15.
//  Copyright © 2015 Leonie Reif. All rights reserved.
//

import Foundation

class History: NSObject {
    
    let date: String
    let carlory: Int
    
    init(date: String, carlory: Int) {
        self.date = date
        self.carlory = carlory
    }
    
    
}