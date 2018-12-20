//
//  main.swift
//  Q22
//
//  Created by Ma Xueyuan on 2018/12/20.
//  Copyright © 2018 Ma Xueyuan. All rights reserved.
//

import Foundation

var solutionDict = [0: 1]

func calculate(dots: Int) -> Int {
    if let solution = solutionDict[dots] {
        return solution
    }
    
    var count = 0
    
    for i in stride(from: 2, through: dots, by: 2) {
        count += calculate(dots: i - 2) * calculate(dots: dots - i)
    }
    
    solutionDict.updateValue(count, forKey: dots)
    return count
}

print(calculate(dots: 16))
