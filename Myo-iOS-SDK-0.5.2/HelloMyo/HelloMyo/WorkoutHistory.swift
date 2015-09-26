//
//  WorkoutHistory.swift
//  MyoFitness
//
//  Created by Thanh Tran on 9/26/15.
//  Copyright © 2015 Leonie Reif. All rights reserved.
//

import Foundation

class WorkoutHistory {
    
    var history = [History]()
    
    init() {
        let day1 = History(date: "Sep 20", carlory: 300)
        let day2 = History(date: "Sep 21", carlory: 300)
        let day3 = History(date: "Sep 22", carlory: 300)
        let day4 = History(date: "Sep 23", carlory: 300)
        let day5 = History(date: "Sep 24", carlory: 300)
        let day6 = History(date: "Sep 25", carlory: 300)
        let day7 = History(date: "Sep 26", carlory: 300)
        let day8 = History(date: "Sep 27", carlory: 300)
        let day9 = History(date: "Sep 28", carlory: 300)
        let day10 = History(date: "Sep 29", carlory: 300)
        
        history = [day1, day2, day3, day4, day5, day6, day7, day8, day9, day10]
        
    }
    
}
