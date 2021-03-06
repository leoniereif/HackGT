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
    let date = NSDate()
    var dataone: [float_t]
    var datatwo: [float_t]
    var reps: Int
    
    init(name: String, calories: Int) {
        self.name = name
        self.calories = calories
        self.dataone = []
        self.datatwo = []
        self.reps = 0
    }
    
    init(name: String, calories: Int, reps: Int) {
        self.name = name
        self.calories = calories
        self.dataone = []
        self.datatwo = []
        self.reps = reps
    }
}