// 853. Car Fleet
// https://leetcode.com/problems/car-fleet/description/

class Solution {
    func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
        var stack = [Double]()
        var sortedCars = position.enumerated().map { ($0.1, speed[$0.0]) }.sorted { $0.0 < $1.0 }

        for i in stride(from: sortedCars.count - 1, through: 0, by: -1) {
            let time = Double(target - sortedCars[i].0) / Double(sortedCars[i].1)
            if stack.isEmpty || stack.last! < time {
                stack.append(time)
            }
        }
        return stack.count
    }
}
