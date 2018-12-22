//
//  main.swift
//  Q23
//
//  Created by Ma Xueyuan on 2018/12/22.
//  Copyright © 2018 Ma Xueyuan. All rights reserved.
//

import Foundation

let maxTimes = 24
let beginCoins = 10
var count = 0

enum Result {
    case win
    case lose
}

func gamble(result: Result, times: Int, coins: Int) {
    let newCoins: Int
    switch  result {
    case .win:
        newCoins = coins + 1
    case .lose:
        newCoins = coins - 1
    }
    
    if newCoins == 0 {
        return
    }
    
    let newTimes = times + 1
    if newTimes == maxTimes {
        count += 1
        return
    }
    
    gamble(result: .win, times: newTimes, coins: newCoins)
    gamble(result: .lose, times: newTimes, coins: newCoins)
}

gamble(result: .win, times: 0, coins: beginCoins)
gamble(result: .lose, times: 0, coins: beginCoins)

print(count)
