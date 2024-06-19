// 881. Boats to Save People
// https://leetcode.com/problems/boats-to-save-people/description/

class Solution {
    func numRescueBoats(_ people: [Int], _ limit: Int) -> Int {
        var people = people.sorted()
        var start = 0
        var end = people.count - 1
        var result = 0
        while start <= end {
            result += 1
            if people[start] + people[end] <= limit {
                start += 1
            }
            end -= 1
        }
        return result
    }
}
