// 567. Permutation in String
// https://leetcode.com/problems/permutation-in-string/description/

class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
       guard s1.count <= s2.count else { return false }
        var sortedS1 = Array(s1).sorted()
        var S2 = Array(s2)
        var lenS1 = sortedS1.count
        for i in 0 ... S2.count - lenS1 {
            if sortedS1 == Array(S2[i ..< i + lenS1]).sorted() {
                return true
            }
        }
        return false
    }
}
