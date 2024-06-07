// 554. Brick Wall
// https://leetcode.com/problems/brick-wall/description/

class Solution {
    func leastBricks(_ wall: [[Int]]) -> Int {
        var gapCountHMap = [Int: Int]()
        var position = 0
        for row in 0 ..< wall.count {
            position = 0
            for col in 0 ..< wall[row].count - 1 {
                position += wall[row][col]
                gapCountHMap[position, default: 0] += 1
            }
        }
        return wall.count - (gapCountHMap.values.max() ?? 0)
    }
}
