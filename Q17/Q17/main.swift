//
//  main.swift
//  Q17
//
//  Created by Ma Xueyuan on 2018/12/08.
//  Copyright © 2018 Ma Xueyuan. All rights reserved.
//

import Foundation

//女性にとりもいないもパタンの一種だから、最初1とセット
var count = 1

enum Gender {
    case male
    case female
}

let row = Array(repeating: Gender.male, count: 30)

func changeMaleToFemale(at index: Int, row: [Gender]) {
    var newRow = row
    newRow[index] = .female
    count += 1
    
    for i in stride(from: index + 2, to: newRow.count, by: 1) {
        changeMaleToFemale(at: i, row: newRow)
    }
}

for i in stride(from: 0, to: row.count, by: 1) {
    changeMaleToFemale(at: i, row: row)
}

print(count)
