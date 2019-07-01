//
//  main.swift
//  Q29
//
//  Created by Ma Xueyuan on 2019/07/01.
//  Copyright © 2019 Ma Xueyuan. All rights reserved.
//

import Foundation

var resultDic = Dictionary<Int, Set<Double>>()

func connect(a: Set<Double>, b: Set<Double>) -> Set<Double> {
    var result = Set<Double>()
    for i in a {
        for j in b {
            result.insert(i + j)
            result.insert(1/(1/i + 1/j))
        }
    }
    return result
}

func getResistance(parts: Int) -> Set<Double> {
    if (parts == 1) {
        return [1.0]
    }
    
    if resultDic.contains(where: {
        $0.key == 1
    }) {
        return resultDic[parts]!
    }
    
    var result = Set<Double>()
    for i in stride(from: 1, through: parts/2, by: 1) {
        let subResult = connect(a: getResistance(parts: i), b: getResistance(parts: parts - i))
        for j in subResult {
            result.insert(j)
        }
    }
    
    return result
}

var best = 0.0
let result = getResistance(parts: 10)
let gold = 1.6180339887
for i in result {
    if abs(i - gold) < abs(best - gold) {
        best = i
    }
}
print(best)
