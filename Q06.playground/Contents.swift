import UIKit

func calc(num: Int, targetNum: Int) -> Bool {
    if num == 1 {
        return false
    }
    
    if num == targetNum {
        return true
    }
    
    if num % 2 == 1 {
        let newNum = num * 3 + 1
        return calc(num: newNum, targetNum: targetNum)
    } else {
        let newNum = num / 2
        return calc(num: newNum, targetNum: targetNum)
    }
}

var count = 0
for i in stride(from: 2, through: 10000, by: 2) {
    if calc(num: i * 3 + 1, targetNum: i) {
        count += 1
    }
}
print(count)
