//
//  main.swift
//  Q12
//
//  Created by Ma Xueyuan on 2018/11/29.
//  Copyright © 2018 Ma Xueyuan. All rights reserved.
//

import Foundation

func include0to9(str: String) -> Bool {
    if str.count < 10 {
        return false
    }
    
    let subStr = str.prefix(10)
    let subStrArray = Array(subStr)
    
    var set = Set<Character>()
    for char in subStrArray {
        set.insert(char)
    }
    
    if set.count == 10 {
        return true
    } else {
        return false
    }
}

//平方根の前10桁は0-9
var n = 1.0
while true {
    let sqrtN = sqrt(n)
    let strSqrtN = "\(sqrtN)".replacingOccurrences(of: ".", with: "")
    if include0to9(str: strSqrtN) {
        print(n)
        break
    }
    n += 1.0
}

//平方根の小数部分前10桁は0-9
var m = 1.0
while true {
    let sqrtM = sqrt(m)
    let strSqrtM = "\(sqrtM)"
    let strSqrtMs = strSqrtM.split(separator: ".")
    if strSqrtMs.count < 2 {
        m += 1
        continue
    }
    let strSqrtM2 = String(strSqrtMs[1])
    if include0to9(str: strSqrtM2) {
        print(m)
        break
    }
    m += 1.0
}
