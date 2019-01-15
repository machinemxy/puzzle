//
//  main.swift
//  Q28
//
//  Created by Ma Xueyuan on 2019/01/15.
//  Copyright © 2019 Ma Xueyuan. All rights reserved.
//

import Foundation

struct Sport {
    var area: Int
    var member: Int
}

var sports = [Sport]()
sports.append(Sport(area: 11000, member: 40))
sports.append(Sport(area: 8000, member: 30))
sports.append(Sport(area: 400, member: 24))
sports.append(Sport(area: 800, member: 20))
sports.append(Sport(area: 900, member: 14))
sports.append(Sport(area: 1800, member: 16))
sports.append(Sport(area: 1000, member: 15))
sports.append(Sport(area: 7000, member: 40))
sports.append(Sport(area: 100, member: 10))
sports.append(Sport(area: 300, member: 12))

var plans = Array.init(repeating: 0, count: 151)

for sport in sports {
    var newPlans = plans
    for i in 0...150 {
        if i == 0 || plans[i] > 0 {
            let j = i + sport.member
            if j > 150 {
                break
            }
            let newArea = plans[i] + sport.area
            newPlans[j] = max(newPlans[j], newArea)
        }
    }
    plans = newPlans
}

var maxArea = 0
for plan in plans {
    if plan > maxArea {
        maxArea = plan
    }
}

print(maxArea)
