// 2017. Grid Game
// https://leetcode.com/problems/grid-game/description/

class Solution {
    func gridGame(_ grid: [[Int]]) -> Int {
        let gridLength = grid[0].count
        var topPrefix = grid[0]
        var botPrefix = grid[1]

        for i in 1 ..< gridLength {
            topPrefix[i] += topPrefix[i - 1]
            botPrefix[i] += botPrefix[i - 1]
        }

        var secondRobotScore = Int.max
        for i in 0 ..< gridLength {
            let topScore = topPrefix[gridLength - 1] - topPrefix[i]
            let botScore = i == 0 ? 0 : botPrefix[i - 1]
            var secondMax = max(topScore, botScore)
            secondRobotScore = min(secondRobotScore, secondMax)
        }
        return secondRobotScore
    }
}

