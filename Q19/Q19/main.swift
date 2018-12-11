//
//  main.swift
//  Q19
//
//  Created by Ma Xueyuan on 2018/12/11.
//  Copyright © 2018 Ma Xueyuan. All rights reserved.
//

import Foundation

func isPrimeNumber(_ number:Int) -> Bool {
    let num = number
    var yakusuu = 0
    
    for divisor in 1...num {
        if num % divisor == 0 {
            yakusuu += 1
        }
    }
    
    if yakusuu == 2 {
        return true
    }else {
        return false
    }
}

let n = 6
var minNum = Int.max

//get n primes
var primes = [Int]()
var i = 2
while primes.count < 6 {
    if isPrimeNumber(i) {
        primes.append(i)
    }
    i += 1
}

func calc(nextPrimeIndex: Int, previousPrime: Int, primes: [Int], largestNum: Int) {
    var newPrimes = primes
    let nextPrime = newPrimes.remove(at: nextPrimeIndex)
    
    var newLargestNum = largestNum
    let num = previousPrime * nextPrime
    if num > largestNum {
        newLargestNum = num
    }
    
    if newPrimes.count == 0 {
        let lastNum = nextPrime * nextPrime
        if lastNum > newLargestNum {
            newLargestNum = lastNum
        }
        
        if newLargestNum < minNum {
            minNum = newLargestNum
        }
        return
    }
    
    for i in 0..<newPrimes.count {
        calc(nextPrimeIndex: i, previousPrime: nextPrime, primes: newPrimes, largestNum: newLargestNum)
    }
}

for i in 0..<primes.count {
    calc(nextPrimeIndex: i, previousPrime: primes[i], primes: primes, largestNum: 0)
}
print(minNum)
