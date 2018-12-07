//
//  main.swift
//  Q16
//
//  Created by Ma Xueyuan on 2018/12/07.
//  Copyright © 2018 Ma Xueyuan. All rights reserved.
//

import Foundation

var count = 0
var patterns = [(Int, Int, Int)]()

func check(_ x: Int) {
    //周長=4xの正方形の面積 = 二つ同じ周長の長方形の面積の和のパタンを探し出す
    let 正方形面積 = x * x
    var 長方形面積set = Set<Int>()
    for i in stride(from: x - 1, through: 1, by: -1) {
        長方形面積set.insert(i * (2 * x - i))
    }
    
    for 長方形面積 in 長方形面積set {
        if 長方形面積set.contains(正方形面積 - 長方形面積) {
            //同じパタンの整数倍カウントしない
            let n1 = 正方形面積
            let n2 = min(長方形面積, 正方形面積 - 長方形面積)
            let n3 = max(長方形面積, 正方形面積 - 長方形面積)
            var existFlag = false
            for pattern in patterns {
                if n1 % pattern.0 == 0 && n2 % pattern.1 == 0 && n3 % pattern.2 == 0 &&
                    n1 / pattern.0 == n2 / pattern.1 && n1 / pattern.0 == n3 / pattern.2
                {
                    existFlag = true
                    break
                }
            }
            if existFlag {
                continue
            } else {
                count += 1
                patterns.append((n1, n2, n3))
            }
        }
    }
}


for i in 2...125 {
    check(i)
}

print(count)
for a in patterns {
    print(a.0, a.1, a.2, separator: " ", terminator: "\n")
}
