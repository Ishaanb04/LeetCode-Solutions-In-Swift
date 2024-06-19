// 3. Longest Substring Without Repeating Characters
// https://leetcode.com/problems/longest-substring-without-repeating-characters/description/

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var arrS = Array(s)
        var start = 0
        var result = 0
        var charHMap = [Character: Int]()
        for end in 0 ..< arrS.count {
            if let lastSeen = charHMap[arrS[end]] {
                start = max(lastSeen + 1, start)
            }
            charHMap[arrS[end]] = end
            result = max(result, end - start + 1)
        }
        return result
    }
}
