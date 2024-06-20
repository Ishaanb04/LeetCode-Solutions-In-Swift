// 567. Permutation in String
// https://leetcode.com/problems/permutation-in-string/description/

class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        guard s1.count <= s2.count else { return false }
        var S1 = Array(s1)
        var S2 = Array(s2)
        var freqS1 = Array(repeating: 0, count: 26)
        var freqS2 = Array(repeating: 0, count: 26)

        for i in 0 ..< S1.count {
            var index = Int(S1[i].asciiValue! - Character("a").asciiValue!)
            freqS1[index] += 1
        }
        var start = 0
        for end in 0 ..< S2.count {
            
            if end - start == S1.count {
                var index = Int(S2[start].asciiValue! - Character("a").asciiValue!)
                freqS2[index] -= 1
                start += 1
            }
            
            var index = Int(S2[end].asciiValue! - Character("a").asciiValue!)
            freqS2[index] += 1
            if freqS1 == freqS2 { return true }
        }
        return false
    }

    func checkInclusion2(_ s1: String, _ s2: String) -> Bool {
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

