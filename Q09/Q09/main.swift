//
//  main.swift
//  Q09
//
//  Created by Ma Xueyuan on 2018/11/27.
//  Copyright © 2018 Ma Xueyuan. All rights reserved.
//

import Foundation

let maxMale = 20
let maxFemale = 10
var count = 0

enum Gender {
    case male
    case female
}

func add(newMember: Gender, currentMale: Int, currentFemale: Int) {
    var newMale = currentMale
    var newFemale = currentFemale
    switch newMember {
    case .male:
        newMale += 1
    case .female:
        newFemale += 1
    }
    
    if newMale == maxMale && newFemale == maxFemale {
        count += 1
        return
    }
    
    if newMale > maxMale {
        return
    }
    
    if newFemale > maxFemale {
        return
    }
    
    if newMale == newFemale {
        return
    }
    
    if (maxMale - newMale) == (maxFemale - newFemale) {
        return
    }
    
    add(newMember: .male, currentMale: newMale, currentFemale: newFemale)
    add(newMember: .female, currentMale: newMale, currentFemale: newFemale)
}

add(newMember: .male, currentMale: 0, currentFemale: 0)
add(newMember: .female, currentMale: 0, currentFemale: 0)
print(count)
