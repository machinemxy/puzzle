//
//  main.swift
//  Q26
//
//  Created by Ma Xueyuan on 2018/12/31.
//  Copyright © 2018 Ma Xueyuan. All rights reserved.
//

import Foundation

struct Point: Equatable{
    var x: Int
    var y: Int
    
    init (x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    static func ==(lhs: Point, rhs: Point) -> Bool{
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}

var car = Point(x: 0, y: 0)
var target = Point(x: 9, y: 9)
var space = target
var steps = 0

func distance(p1: Point, p2: Point) -> Int {
    return abs(p1.x - p2.x) + abs(p1.y - p2.y)
}

func swapCarAndSpace() {
    steps += 1
    let tempPoint = car
    car = space
    space = tempPoint
}

while car != target {
    let nextPosition: Point
    if car.y >= car.x {
        nextPosition = Point(x: car.x + 1, y: car.y)
    } else {
        nextPosition = Point(x: car.x, y: car.y + 1)
    }
    
    steps += distance(p1: space, p2: nextPosition)
    space = nextPosition
    swapCarAndSpace()
}

print(steps)
