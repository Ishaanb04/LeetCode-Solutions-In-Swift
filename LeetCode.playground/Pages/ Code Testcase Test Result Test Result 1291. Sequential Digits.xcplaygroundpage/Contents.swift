// 1291. Sequential Digits
// https://leetcode.com/problems/sequential-digits/

class Solution {
    func sequentialDigits(_ low: Int, _ high: Int) -> [Int] {
        var output = [Int]()

        // Generate all sequential digit numbers
        for start in 1 ... 9 {
            var num = start
            var nextDigit = start + 1
            while num <= high, nextDigit <= 9 {
                num = num * 10 + nextDigit
                nextDigit += 1
                if num >= low, num <= high {
                    output.append(num)
                }
            }
        }

        return output.sorted()
    }
}
