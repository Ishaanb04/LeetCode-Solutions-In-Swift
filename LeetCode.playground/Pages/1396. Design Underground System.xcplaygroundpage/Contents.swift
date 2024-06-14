// 1396. Design Underground System
// https://leetcode.com/problems/design-underground-system/description/

class UndergroundSystem {
    var averageHMap: [String: [Double]]
    var travelHMap: [Int: (String, Int)]
    var startionStart: String
    var stationEnd: String

    init() {
        averageHMap = [String: [Double]]()
        travelHMap = [Int: (String, Int)]()
        startionStart = "START*_"
        stationEnd = "END*_"
    }

    func checkIn(_ id: Int, _ stationName: String, _ t: Int) {
        if travelHMap[id] == nil {
            travelHMap[id] = (stationName, t)
        }
    }

    func checkOut(_ id: Int, _ stationName: String, _ t: Int) {
        if let passengerD = travelHMap[id] {
            travelHMap.removeValue(forKey: id)
            averageHMap["\(startionStart)\(passengerD.0)" + "\(stationEnd)\(stationName)", default: []].append(Double(t - passengerD.1))
        }
    }

    func getAverageTime(_ startStation: String, _ endStation: String) -> Double {
        let avrArr = averageHMap["\(startionStart)\(startStation)" + "\(stationEnd)\(endStation)", default: []]
        return avrArr.reduce(0) { $0 + $1 } / Double(avrArr.count)
    }
}

/**
 * Your UndergroundSystem object will be instantiated and called as such:
 * let obj = UndergroundSystem()
 * obj.checkIn(id, stationName, t)
 * obj.checkOut(id, stationName, t)
 * let ret_3: Double = obj.getAverageTime(startStation, endStation)
 */
print([10, 20, 30].reduce(0) { $0 + $1 })
