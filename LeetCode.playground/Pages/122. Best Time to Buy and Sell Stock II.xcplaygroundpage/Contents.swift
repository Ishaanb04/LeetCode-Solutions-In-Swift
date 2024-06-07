// 122. Best Time to Buy and Sell Stock II
// https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/description/

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var maxProfit = 0
        var difference = 0
        for index in 1 ..< prices.count {
            difference = prices[index] - prices[index - 1]
            maxProfit += max(difference, 0)
        }
        return maxProfit
    }
}
