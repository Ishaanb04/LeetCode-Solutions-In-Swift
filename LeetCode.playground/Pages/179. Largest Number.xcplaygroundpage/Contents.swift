// 179. Largest Number
// https://leetcode.com/problems/largest-number/description/

class Solution {
    func largestNumber(_ nums: [Int]) -> String {
        func compFn(a: String, b: String) -> Bool {
            return a + b > b + a
        }

        let res = nums.sorted { compFn(a: "\($0)", b: "\($1)") }.map { "\($0)" }
        return res[0] == "0" ? "0" : res.joined()
    }
}
