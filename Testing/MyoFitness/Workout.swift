//
//  Workout.swift
//  MyoFitness
//
//  Created by Leonie Reif on 26/09/15.
//  Copyright © 2015 Leonie Reif. All rights reserved.
//

import Foundation

class Workout: NSObject {
    let name: String
    let calories: Int
    
    init(name: String, calories: Int) {
        self.name = name
        self.calories = calories
    }
}