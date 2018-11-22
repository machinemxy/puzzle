import UIKit

//init cards
var cards = Array(repeating: false, count: 101)

//flip cards
for i in 2...100 {
    for j in stride(from: i, through: 100, by: i) {
        cards[j] = !cards[j]
    }
}

//print results
for i in 1...100 {
    if !cards[i] {
        print(i)
    }
}
