import UIKit

//進数ロジック実装
func cal(n: Int, x: Int) -> String {
    var str = ""
    var restNum = n
    while restNum > 0 {
        let mod = restNum % x
        str += "\(mod)"
        restNum /= x
    }
    return str
}

func reverse(str: String) -> String {
    return String(str.reversed())
}

var i = 10
while true {
    let 十進数 = cal(n: i, x: 10)
    let 二進数 = cal(n: i, x: 2)
    let 八進数 = cal(n: i, x: 8)
    if 十進数 == reverse(str: 十進数) && 二進数 == reverse(str: 二進数) && 八進数 == reverse(str: 八進数) {
        print(i)
        break
    }
    i += 1
}


