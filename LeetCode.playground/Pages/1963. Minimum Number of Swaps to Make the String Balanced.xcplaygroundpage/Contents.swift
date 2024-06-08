// 1963. Minimum Number of Swaps to Make the String Balanced
//https://leetcode.com/problems/minimum-number-of-swaps-to-make-the-string-balanced/description/

class Solution {
    func minSwaps(_ s: String) -> Int {
        let opening: Character = "["
        let closing: Character = "]"
        let array = Array(s)
        var extraClosingCount = 0
        var result = 0
        for char in array {
            if char == closing {
                extraClosingCount += 1
            } else if char == opening {
                extraClosingCount -= 1
            }
            result = max(result, extraClosingCount)
        }
        return (result + 1) / 2
    }
}
