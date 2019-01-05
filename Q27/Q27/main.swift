//
//  main.swift
//  Q27
//
//  Created by Ma Xueyuan on 2019/01/05.
//  Copyright © 2019 Ma Xueyuan. All rights reserved.
//

import Foundation

struct Point: Hashable{
    var x: Int
    var y: Int
    
    init (x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    static func ==(lhs: Point, rhs: Point) -> Bool{
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(x)
        hasher.combine(y)
    }
}

enum Direction {
    case up
    case down
    case left
    case right
}

var count = 0
let maxX = 6
let maxY = 4

func turnLeft(direction: Direction) -> Direction {
    switch direction {
    case .left:
        return .down
    case .down:
        return .right
    case .right:
        return .up
    case .up:
        return .left
    }
}

func drive(car: Point, direction: Direction, yokoPath: Set<Point>, tatePath: Set<Point>) {
    let nextDirection: Point
    switch direction {
    case .down:
        nextDirection = Point(x: car.x, y: car.y - 1)
    case .up:
        nextDirection = Point(x: car.x, y: car.y + 1)
    case .left:
        nextDirection = Point(x: car.x - 1, y: car.y)
    case .right:
        nextDirection = Point(x: car.x + 1, y: car.y)
    }
    
    //check whether nextDirection is valid
    if nextDirection.x < 0 || nextDirection.y < 0 || nextDirection.x > maxX || nextDirection.y > maxY {
        return
    }
    
    //check if reach the goal
    if nextDirection.x == maxX && nextDirection.y == maxY {
        count += 1
        return
    }
    
    //check is the path already been driven
    let minPoint = Point(x: min(car.x, nextDirection.x), y: min(car.y, nextDirection.y))
    var newYokoPath = yokoPath
    var newTatePath = tatePath
    switch direction {
    case .up, .down:
        if tatePath.contains(minPoint) {
            return
        } else {
            newTatePath.insert(minPoint)
        }
    case .left, .right:
        if yokoPath.contains(minPoint) {
            return
        } else {
            newYokoPath.insert(minPoint)
        }
    }
    
    //continue drive
    drive(car: nextDirection, direction: direction, yokoPath: newYokoPath, tatePath: newTatePath)
    drive(car: nextDirection, direction: turnLeft(direction: direction), yokoPath: newYokoPath, tatePath: newTatePath)
}

drive(car: Point(x: 0, y: 0), direction: .right, yokoPath: Set<Point>(), tatePath: Set<Point>())

print(count)
