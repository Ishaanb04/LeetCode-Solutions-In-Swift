// 2483. Minimum Penalty for a Shop
// https://leetcode.com/problems/minimum-penalty-for-a-shop/description/

class Solution {
    func bestClosingTime(_ customers: String) -> Int {
        var cArr = Array(customers)
        var customerBeforeOpen = 0
        for index in 0 ..< customers.count {
            if cArr[index] == "Y" {
                customerBeforeOpen += 1
            }
        }
        
        var hour = 0
        var customerBeforeClose = 0
        var minPenalty = customerBeforeOpen
        var penalty = 0
        
        for index in 0 ..< customers.count {
            if cArr[index] == "Y" {
                customerBeforeOpen -= 1
            }else {
                customerBeforeClose += 1
            }
            penalty = customerBeforeOpen + customerBeforeClose
            if penalty < minPenalty {
                minPenalty = penalty
                hour = index + 1
            }
        }
        return hour
    }
}
