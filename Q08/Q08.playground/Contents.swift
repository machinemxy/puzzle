import UIKit

enum Direction {
    case up
    case down
    case left
    case right
}

var count = 0
let steps = 12

func extend(position: CGPoint, direction: Direction, history: [CGPoint], restSteps: Int) {
    let newPosition: CGPoint
    switch direction {
    case .up:
        newPosition = CGPoint(x: position.x, y: position.y + 1)
    case .down:
        newPosition = CGPoint(x: position.x, y: position.y - 1)
    case .left:
        newPosition = CGPoint(x: position.x - 1, y: position.y)
    case .right:
        newPosition = CGPoint(x: position.x + 1, y: position.y)
    }
    
    if history.contains(newPosition) {
        return
    }
    
    var newHistory = [CGPoint](history)
    newHistory.append(newPosition)
    
    let newRestSteps = restSteps - 1
    if newRestSteps == 0 {
        count += 1
        return
    }
    
    extend(position: newPosition, direction: .up, history: newHistory, restSteps: newRestSteps)
    extend(position: newPosition, direction: .down, history: newHistory, restSteps: newRestSteps)
    extend(position: newPosition, direction: .left, history: newHistory, restSteps: newRestSteps)
    extend(position: newPosition, direction: .right, history: newHistory, restSteps: newRestSteps)
}

extend(position: CGPoint(x: 0, y: 0), direction: .up, history: [CGPoint(x: 0, y: 0)], restSteps: steps)
extend(position: CGPoint(x: 0, y: 0), direction: .down, history: [CGPoint(x: 0, y: 0)], restSteps: steps)
extend(position: CGPoint(x: 0, y: 0), direction: .left, history: [CGPoint(x: 0, y: 0)], restSteps: steps)
extend(position: CGPoint(x: 0, y: 0), direction: .right, history: [CGPoint(x: 0, y: 0)], restSteps: steps)

print(count)
