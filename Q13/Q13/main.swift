//
//  main.swift
//  Q13
//
//  Created by Ma Xueyuan on 2018/12/03.
//  Copyright © 2018 Ma Xueyuan. All rights reserved.
//

import Foundation

//READ+WRITE+TALK=SKILL成立のす数字は何通り
var count = 0

let letterPool = ["D", "E", "K", "L", "A", "T", "I", "R", "W", "S"]
var numberPool = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
var decidedLetter: [Int?] = Array(repeating: nil, count: 10)

func pickNumber(pickedNumberIndex: Int, numberPool: [Int], decidedLetter: [Int?], testLevel: Int, additionalNum: Int) {
    //find the next letter to set
    var i = 0
    while true {
        if decidedLetter[i] == nil {
            break
        }
        i += 1
    }
    
    //set the letter with pickedNumber
    var newDecidedLetter = decidedLetter
    newDecidedLetter[i] = numberPool[pickedNumberIndex]
    
    //remove the pickedNumber from pool
    var newNumberPool = numberPool
    newNumberPool.remove(at: pickedNumberIndex)
    
    if testLevel == 1 {
        //level 1: D + E + K = ?L
        if i < 3 {
            for j in 0..<newNumberPool.count {
                pickNumber(pickedNumberIndex: j, numberPool: newNumberPool, decidedLetter: newDecidedLetter, testLevel: 1, additionalNum: additionalNum)
            }
        } else {
            let sum = newDecidedLetter[0]! + newDecidedLetter[1]! + newDecidedLetter[2]!
            if sum % 10 == newDecidedLetter[3]! {
                let newAdditionalNum = sum / 10
                for j in 0..<newNumberPool.count {
                    pickNumber(pickedNumberIndex: j, numberPool: newNumberPool, decidedLetter: newDecidedLetter, testLevel: 2, additionalNum: newAdditionalNum)
                }
            }
        }
    } else if testLevel == 2 {
        //level 2: A + T + L + level1のadditionalNum = ?L
        if i < 5 {
            for j in 0..<newNumberPool.count {
                pickNumber(pickedNumberIndex: j, numberPool: newNumberPool, decidedLetter: newDecidedLetter, testLevel: 2, additionalNum: additionalNum)
            }
        } else {
            let sum = newDecidedLetter[4]! + newDecidedLetter[5]! + newDecidedLetter[3]! + additionalNum
            if sum % 10 == newDecidedLetter[3]! {
                let newAdditionalNum = sum / 10
                for j in 0..<newNumberPool.count {
                    pickNumber(pickedNumberIndex: j, numberPool: newNumberPool, decidedLetter: newDecidedLetter, testLevel: 3, additionalNum: newAdditionalNum)
                }
            }
        }
    } else if testLevel == 3 {
        //level 3: E + I + A + level2のadditionalNum = ?I
        if i < 6 {
            for j in 0..<newNumberPool.count {
                pickNumber(pickedNumberIndex: j, numberPool: newNumberPool, decidedLetter: newDecidedLetter, testLevel: 3, additionalNum: additionalNum)
            }
        } else {
            let sum = newDecidedLetter[1]! + newDecidedLetter[6]! + newDecidedLetter[4]! + additionalNum
            if sum % 10 == newDecidedLetter[6]! {
                let newAdditionalNum = sum / 10
                for j in 0..<newNumberPool.count {
                    pickNumber(pickedNumberIndex: j, numberPool: newNumberPool, decidedLetter: newDecidedLetter, testLevel: 4, additionalNum: newAdditionalNum)
                }
            }
        }
    } else if testLevel == 4 {
        //The first Number cannot be 0, so if 0 still exist in the number pool, the problem has no solution
        if newNumberPool.contains(0) {
            return
        }
        
        //R + R + T + level3のadditionalNum = ?K
        if i < 7 {
            for j in 0..<newNumberPool.count {
                pickNumber(pickedNumberIndex: j, numberPool: newNumberPool, decidedLetter: newDecidedLetter, testLevel: 4, additionalNum: additionalNum)
            }
        } else {
            let sum = newDecidedLetter[7]! * 2 + newDecidedLetter[5]! + additionalNum
            if sum % 10 == newDecidedLetter[2]! {
                let newAdditionalNum = sum / 10
                for j in 0..<newNumberPool.count {
                    pickNumber(pickedNumberIndex: j, numberPool: newNumberPool, decidedLetter: newDecidedLetter, testLevel: 5, additionalNum: newAdditionalNum)
                }
            }
        }
    } else {
        //final level: W + level4のadditionalNum = S
        if newDecidedLetter[8]! + additionalNum == newNumberPool[0] {
            count += 1
        }
    }
}

//main
for i in 0..<numberPool.count {
    pickNumber(pickedNumberIndex: i, numberPool: numberPool, decidedLetter: decidedLetter, testLevel: 1, additionalNum: 0)
}
print(count)
