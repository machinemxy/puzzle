//
//  main.swift
//  Q20
//
//  Created by Ma Xueyuan on 2018/12/14.
//  Copyright © 2018 Ma Xueyuan. All rights reserved.
//

import Foundation

let matrix = [
    1, 14, 14, 4,
    11, 7, 6, 9,
    8, 10, 10, 5,
    13, 2, 3, 15
]

var sumOfAllNumbers = 0
for number in matrix {
    sumOfAllNumbers += number
}
var countTable = Array(repeating: 0, count: sumOfAllNumbers + 1)

func addNewNumber(numberIndex: Int, currentSum: Int) {
    let sum = currentSum + matrix[numberIndex]
    countTable[sum] += 1
    for i in stride(from: numberIndex + 1, to: matrix.count, by: 1) {
        addNewNumber(numberIndex: i, currentSum: sum)
    }
}

for i in 0..<matrix.count {
    addNewNumber(numberIndex: i, currentSum: 0)
}

var maxIndex = 0
var maxCount = 0
for i in 0..<countTable.count {
    if countTable[i] > maxCount {
        maxCount = countTable[i]
        maxIndex = i
    }
}

print(maxIndex, maxCount, separator: "(", terminator: ")\n")
