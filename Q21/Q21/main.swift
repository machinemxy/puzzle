//
//  main.swift
//  Q21
//
//  Created by Ma Xueyuan on 2018/12/15.
//  Copyright © 2018 Ma Xueyuan. All rights reserved.
//

import Foundation

var count = 0

func generateNextLayer(previousLayer: [Int]) -> [Int] {
    var nextLayer = [Int]()
    nextLayer.append(1)
    
    for i in 0..<(previousLayer.count - 1) {
        let num1 = previousLayer[i]
        let num2 = previousLayer[i + 1]
        if num1 - num2 == 0 {
            nextLayer.append(0)
            count += 1
        } else {
            nextLayer.append(1)
        }
    }
    
    nextLayer.append(1)
    
    return nextLayer
}

var layer = [1, 1]
var layerNo = 2
while count < 2014 {
    layerNo += 1
    layer = generateNextLayer(previousLayer: layer)
}

print(layerNo)
