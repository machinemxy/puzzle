//
//  main.swift
//  Q11
//
//  Created by Ma Xueyuan on 2018/11/27.
//  Copyright © 2018 Ma Xueyuan. All rights reserved.
//

import Foundation

var n1 = 89
var n2 = 144
var count = 0

func get各桁の数字の足し(_ num: Int) -> Int {
    var tNum = num
    var result = 0
    while(tNum > 0) {
        result += tNum % 10
        tNum /= 10
    }
    return result
}

while count < 5 {
    let n3 = n1 + n2
    let divider = get各桁の数字の足し(n3)
    if n3 % divider == 0 {
        print(n3)
        count += 1
    }
    
    n1 = n2
    n2 = n3
}

