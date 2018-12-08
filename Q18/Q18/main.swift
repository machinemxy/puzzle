//
//  main.swift
//  Q18
//
//  Created by Ma Xueyuan on 2018/12/08.
//  Copyright © 2018 Ma Xueyuan. All rights reserved.
//

import Foundation

var isAnswerGot = false

func isSumOfTwoNumIn平方数Set(currentNum: Int, nextNumIndex: Int, numPool: [Int], 平方数Set: Set<Int>) {
    if isAnswerGot {
        return
    }
    
    var newNumPool = numPool
    let nextNum = newNumPool.remove(at: nextNumIndex)
    let sumNum = currentNum + nextNum
    
    if !平方数Set.contains(sumNum) {
        return
    }
    
    //if the last number + the first number = 平方数, this is the solution!
    if newNumPool.count == 0 {
        let sumNum = nextNum + 1
        if 平方数Set.contains(sumNum) {
            isAnswerGot = true
        }
        return
    }
    
    for i in 0..<newNumPool.count {
        isSumOfTwoNumIn平方数Set(currentNum: nextNum, nextNumIndex: i, numPool: newNumPool, 平方数Set: 平方数Set)
    }
}

func check(_ n: Int) {
    // n * 2より小さいの平方数取得
    var 平方数lowerThan2n = Set<Int>()
    var i = 1
    while(true) {
        let i2 = i * i
        if i2 < n * 2 {
            平方数lowerThan2n.insert(i2)
            i += 1
        } else {
            break
        }
    }
    
    var numberPool = [Int]()
    for j in 2...n {
        numberPool.append(j)
    }
    
    for k in 0..<numberPool.count {
        //the first number is 1
        isSumOfTwoNumIn平方数Set(currentNum: 1, nextNumIndex: k, numPool: numberPool, 平方数Set: 平方数lowerThan2n)
    }
}

var i = 2
while(!isAnswerGot) {
    check(i)
    
    if isAnswerGot {
        print(i)
    } else {
        i += 1
    }
}
