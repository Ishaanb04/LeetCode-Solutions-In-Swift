import Foundation
class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        var startSpeed = 1
        var endSpeed = piles.max() ?? 1
        
        while startSpeed < endSpeed {
            var speedK = startSpeed + (endSpeed - startSpeed) / 2
            
            var time = 0
            for pile in piles {
                time += Int(ceil(Double(pile) / Double(speedK)))
            }
            
            if time <= h {
                endSpeed = speedK - 1
            } else {
                startSpeed = speedK
            }
        }
        return startSpeed
    }
}
