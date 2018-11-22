import UIKit

let cash = 1000
var count = 0

let max500 = cash / 500

for i in 0...max500 {
    let restCash = cash - i * 500
    let max100 = restCash / 100
    for j in 0...max100 {
        let restCash2 = restCash - j * 100
        let max50 = restCash2 / 50
        for k in 0...max50 {
            let count10 = (restCash2 - k * 50) / 10
            if count10 + i + j + k <= 15 {
                count += 1
            }
        }
    }
}

print(count)
