//
//  WorkoutList.swift
//  MyoFitness
//
//  Created by Leonie Reif on 25/09/15.
//  Copyright © 2015 Leonie Reif. All rights reserved.
//

import Foundation
import UIKit

class WorkoutList {
    
    var workouts = [Workout]()
    
    init() {
        let curl = Workout(name: "Curl", calories: 20)
        let squads = Workout(name: "Squat", calories: 30)
        let bench = Workout(name: "Bench Press", calories: 40)
        let lateral = Workout(name: "Lateral Rises", calories: 50)
        let triceps = Workout(name: "Triceps Press", calories: 60)
        self.workouts = [curl, squads, bench, lateral, triceps]
    }
}
