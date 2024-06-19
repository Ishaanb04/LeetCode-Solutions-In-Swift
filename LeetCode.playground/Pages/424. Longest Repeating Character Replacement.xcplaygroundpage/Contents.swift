// 424. Longest Repeating Character Replacement
// https://leetcode.com/problems/longest-repeating-character-replacement/description/

class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        var charFrequency = Array(Array(repeating: 0, count: 26))
        var arrS = Array(s)
        var result = 0
        var start = 0
        for end in 0 ..< arrS.count {
            
            var charIndex = Int(arrS[end].asciiValue!) - Int(Character("A").asciiValue!)
            charFrequency[charIndex] += 1
            var maxFrequency = charFrequency.max() ?? 0

            while (end - start + 1) - maxFrequency > k {
                var index = Int(arrS[start].asciiValue! - Character("A").asciiValue!)
                charFrequency[index] -= 1
                start += 1
            }
            result = max(result, end - start + 1)
        }
        return result
    }
}

