import UIKit

//init cards
var cards = [Bool]()
for _ in 1...101 {
    cards.append(false)
}

//flip cards
for i in 2...100 {
    var j = i
    while j <= 100 {
        cards[j] = !cards[j]
        j += i
    }
}

//print results
for i in 1...100 {
    if !cards[i] {
        print(i)
    }
}
