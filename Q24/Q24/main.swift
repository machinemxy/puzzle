//
//  main.swift
//  Q24
//
//  Created by Ma Xueyuan on 2018/12/24.
//  Copyright © 2018 Ma Xueyuan. All rights reserved.
//

import Foundation

let singles = [1,2,3,4,5,6,7,8,9]
let doubles = [[1,2],[2,3],[3,6],[6,9],[9,8],[8,7],[7,4],[4,1]]
var count = 0

enum RemoveType {
    case single
    case double
}

func remove(removeType: RemoveType, removeIndex: Int, singles: [Int], doubles: [[Int]]) {
    var newSingles = singles
    var newDoubles = doubles
    
    //remove
    switch removeType {
    case .single:
        let removedSingle = newSingles.remove(at: removeIndex)
        for i in stride(from: newDoubles.count-1, through: 0, by: -1) {
            for number in newDoubles[i] {
                if number == removedSingle {
                    newDoubles.remove(at: i)
                    break
                }
            }
        }
    case .double:
        let removedDouble = newDoubles.remove(at: removeIndex)
        for number in removedDouble {
            for i in stride(from: newSingles.count-1, through: 0, by: -1) {
                if newSingles[i] == number {
                    newSingles.remove(at: i)
                    break
                }
            }
            
            for i in stride(from: newDoubles.count-1, through: 0, by: -1) {
                for number2 in newDoubles[i] {
                    if number2 == number {
                        newDoubles.remove(at: i)
                        break
                    }
                }
            }
        }
    }
    
    if newSingles.count == 0 {
        count += 1
        return
    }
    
    for i in 0..<newSingles.count {
        remove(removeType: .single, removeIndex: i, singles: newSingles, doubles: newDoubles)
    }
    
    for i in 0..<newDoubles.count {
        remove(removeType: .double, removeIndex: i, singles: newSingles, doubles: newDoubles)
    }
}

for i in 0..<singles.count {
    remove(removeType: .single, removeIndex: i, singles: singles, doubles: doubles)
}

for i in 0..<doubles.count {
    remove(removeType: .double, removeIndex: i, singles: singles, doubles: doubles)
}

print(count)
