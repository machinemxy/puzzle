//
//  main.swift
//  Q30
//
//  Created by Ma Xueyuan on 2019/07/02.
//  Copyright © 2019 Ma Xueyuan. All rights reserved.
//

import Foundation

var solutionDic = Dictionary<Int, Int>()

func solve(_ ana: Int) -> Int {
    if ana == 1 {
        return 1
    }
    
    if solutionDic.contains(where: {$0.key == ana}) {
        return solutionDic[ana]!
    }
    
    var count = 0
    
    for i in stride(from: 1, through: ana/2, by: 1) {
        let j = ana - i
        if (i == j) {
            count += solve(i) * (solve(j) + 1) / 2
        } else {
            count += solve(i) * solve(j)
        }
    }
    
    for i in stride(from: 1, through: ana/3, by: 1) {
        for j in stride(from: i, through: (ana-i)/2, by: 1) {
            let k = ana - i - j
            if i == j && j == k {
                count += solve(i) * (solve(j) + 1) * (solve(k) + 2) / 6
            } else if i == j {
                count += solve(i) * (solve(j) + 1) * solve(k) / 2
            } else if i == k {
                count += solve(i) * solve(j) * (solve(k) + 1) / 2
            } else if j == k {
                count += solve(i) * solve(j) * (solve(k) + 1) / 2
            } else {
                count += solve(i) * solve(j) * solve(k)
            }
        }
    }
    
    solutionDic[ana] = count
    
    return count
}

print(solve(20))
