import UIKit

var times = 0
var woods = 1
let workers = 5
let targetWoods = 100

while woods < targetWoods {
    times += 1
    woods += min(woods, workers)
}

print(times)
