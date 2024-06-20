// 739. Daily Temperatures
// https://leetcode.com/problems/daily-temperatures/description/

class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var stack = [(Int, Int)]()
        var result = Array(repeating: 0, count: temperatures.count)

        for (i, temperature) in temperatures.enumerated() {
            while !stack.isEmpty, stack.last!.0 < temperature {
                let element = stack.removeLast()
                result[element.1] = i - element.1
            }
            stack.append((temperature, i))
        }
        return result
    }
}
