//
//  main.swift
//  Q15
//
//  Created by Ma Xueyuan on 2018/12/05.
//  Copyright © 2018 Ma Xueyuan. All rights reserved.
//

import Foundation

let a = 0
let b = 10
var count = 0

func move(a: Int, b: Int, aStep: Int, bStep: Int) {
    let newA = a + aStep
    let newB = b - bStep
    
    if newA == newB {
        count += 1
        return
    }
    
    if newA > newB {
        return
    }
    
    for i in 1...4 {
        for j in 1...4 {
            move(a: newA, b: newB, aStep: i, bStep: j)
        }
    }
}

for i in 1...4 {
    for j in 1...4 {
        move(a: a, b: b, aStep: i, bStep: j)
    }
}
print(count)
