import UIKit

func toBinaryString(dateString: String) -> String {
    var dateInt = Int(dateString)!
    var binaryString = ""
    while dateInt != 0 {
        let mod = dateInt % 2
        binaryString += "\(mod)"
        dateInt /= 2
    }
    
    return binaryString
}

let formatter = DateFormatter()
formatter.dateFormat = "yyyyMMdd"
let startDate = formatter.date(from: "19641010")!
let endDate = formatter.date(from: "20200724")!

var date = startDate
while date <= endDate {
    let dateString = formatter.string(from: date)
    let binaryString = toBinaryString(dateString: dateString)
    if binaryString == String(binaryString.reversed()) {
        print(dateString)
    }
    let day = TimeInterval.init(exactly: 3600 * 24)!
    date.addTimeInterval(day)
}
