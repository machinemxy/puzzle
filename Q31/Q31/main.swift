//
//  main.swift
//  Q31
//
//  Created by Ma Xueyuan on 2019/07/02.
//  Copyright © 2019 Ma Xueyuan. All rights reserved.
//

import Foundation

var count = 0
let n = 6

enum Direction {
    case right
    case down
}

struct Position: Hashable {
    var x: Int
    var y: Int
}

func move(pos: Position, direction: Direction, movedYoko: Set<Position>, movedTate: Set<Position>, isSecondTime: Bool) {
    var newMovedYoko = movedYoko
    var newMovedTate = movedTate
    var newPos = pos
    
    switch direction {
    case .down:
        if movedTate.contains(pos) {
            return
        }
        newMovedTate.insert(pos)
        newPos.y += 1
    case .right:
        if movedYoko.contains(pos) {
            return
        }
        newMovedYoko.insert(pos)
        newPos.x += 1
    }
    
    if pos.x == n && pos.y == n {
        if isSecondTime {
            count += 1
            return
        } else {
            move(pos: Position(x: 0, y: 0), direction: .down, movedYoko: newMovedYoko, movedTate: newMovedTate, isSecondTime: true)
            move(pos: Position(x: 0, y: 0), direction: .right, movedYoko: newMovedYoko, movedTate: newMovedTate, isSecondTime: true)
        }
    } else {
        if (pos.x < n) {
            move(pos: newPos, direction: .right, movedYoko: newMovedYoko, movedTate: newMovedTate, isSecondTime: isSecondTime)
        }
        if (pos.y < n) {
            move(pos: newPos, direction: .down, movedYoko: newMovedYoko, movedTate: newMovedTate, isSecondTime: isSecondTime)
        }
    }
}

move(pos: Position(x: 0, y: 0), direction: .down, movedYoko: Set<Position>(), movedTate: Set<Position>(), isSecondTime: false)
move(pos: Position(x: 0, y: 0), direction: .right, movedYoko: Set<Position>(), movedTate: Set<Position>(), isSecondTime: false)
print(count)
