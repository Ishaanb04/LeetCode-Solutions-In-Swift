// 1461. Check If a String Contains All Binary Codes of Size K
// https://leetcode.com/problems/check-if-a-string-contains-all-binary-codes-of-size-k/description/
import Foundation
class Solution {
    func hasAllCodes(_ s: String, _ k: Int) -> Bool {
        guard s.count > k else { return false }
        let sArr = Array(s)
        var start = 0
        var subSet = Set<String>()
        for end in k ... sArr.count {
            subSet.insert(String(Array(sArr[start ..< end])))
            start += 1
        }
        return subSet.count == (1 << k)
    }
}
