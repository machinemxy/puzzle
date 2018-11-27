//
//  main.swift
//  Q10
//
//  Created by Ma Xueyuan on 2018/11/27.
//  Copyright © 2018 Ma Xueyuan. All rights reserved.
//

import Foundation

let eu = [0,32,15,19,4,21,2,25,17,34,6,27,13,
          36,11,30,8,23,10,5,24,16,33,1,20,14,
          31,9,22,18,29,7,28,12,35,3,26
]

let us = [0,28,9,26,30,11,7,20,32,17,5,22,34,
          15,3,24,36,13,1,0,27,10,25,29,12,8,
          19,31,18,6,21,33,16,4,23,35,14,2
]

var count = 0

for n in 2...36 {
    var maxEu = 0
    var maxUs = 0
    for i in 0..<eu.count {
        var sum = 0
        for j in 0..<n {
            sum += eu[(i + j) % eu.count]
        }
        if sum > maxEu {
            maxEu = sum
        }
    }
    
    for i in 0..<us.count {
        var sum = 0
        for j in 0..<n {
            sum += us[(i + j) % us.count]
        }
        if sum > maxUs {
            maxUs = sum
        }
    }
    
    if maxEu < maxUs {
        count += 1
    }
}

print(count)
