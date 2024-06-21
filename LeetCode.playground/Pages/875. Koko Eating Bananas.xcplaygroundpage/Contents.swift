// 875. Koko Eating Bananas
// https://leetcode.com/problems/koko-eating-bananas/description/
import Foundation

class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        var leftBound = 1
        var rightBound = piles.max() ?? 1
        var result = rightBound

        while leftBound <= rightBound {
            var k = leftBound + (rightBound - leftBound) / 2

            var time = 0
            for bananas in piles {
                time += Int(ceil(Double(bananas) / Double(k)))
            }

            if time <= h {
                result = min(result, k)
                rightBound = k - 1
            } else {
                leftBound = k + 1
            }
        }
        return result
    }
}


