//
//  main.swift
//  Q25
//
//  Created by Ma Xueyuan on 2018/12/27.
//  Copyright © 2018 Ma Xueyuan. All rights reserved.
//

import Foundation

var maxCrosses = 0

enum Side {
    case left
    case right
}

struct Ana {
    var side: Side
    var no: Int
    
    init(side: Side, no: Int) {
        self.side = side
        self.no = no
    }
}

struct Line {
    var left: Int
    var right: Int
    
    init(left: Int, right: Int) {
        self.left = left
        self.right = right
    }
}

func compareMaxCrosses(currentCrosses: Int) {
    if currentCrosses > maxCrosses {
        maxCrosses = currentCrosses
    }
}

func addLine(currentAna: Ana, nextAna: Ana, lines: [Line], leftAnas: Set<Int>, rightAnas: Set<Int>, crosses: Int) {
    var newLines = lines
    var newLeftAnas = leftAnas
    var newRightAnas = rightAnas
    let newLine: Line
    var newCrosses = crosses
    
    switch currentAna.side {
    case .left:
        newLine = Line(left: currentAna.no, right: nextAna.no)
        newRightAnas.remove(nextAna.no)
    case .right:
        newLine = Line(left: nextAna.no, right: currentAna.no)
        newLeftAnas.remove(nextAna.no)
    }
    newLines.append(newLine)
    
    for line in lines {
        if newLine.left > line.left && newLine.right < line.right {
            newCrosses += 1
        } else if newLine.left < line.left && newLine.right > line.right {
            newCrosses += 1
        }
    }
    
    switch currentAna.side {
    case .left:
        if newLeftAnas.count == 0 {
            compareMaxCrosses(currentCrosses: newCrosses)
            return
        }
        
        for i in newLeftAnas {
            addLine(currentAna: nextAna, nextAna: Ana(side: .left, no: i), lines: newLines, leftAnas: newLeftAnas, rightAnas: newRightAnas, crosses: newCrosses)
        }
    case .right:
        if newRightAnas.count == 0 {
            compareMaxCrosses(currentCrosses: newCrosses)
            return
        }
        
        for i in newRightAnas {
            addLine(currentAna: nextAna, nextAna: Ana(side: .right, no: i), lines: newLines, leftAnas: newLeftAnas, rightAnas: newRightAnas, crosses: newCrosses)
        }
    }
}

var leftAnas = Set<Int>()
var rightAnas = Set<Int>()
for i in 1...5 {
    leftAnas.insert(i)
}
for i in 0...5 {
    rightAnas.insert(i)
}

for i in rightAnas {
    addLine(currentAna: Ana(side: .left, no: 0), nextAna: Ana(side: .right, no: i), lines: [Line](), leftAnas: leftAnas, rightAnas: rightAnas, crosses: 0)
}

print(maxCrosses)
