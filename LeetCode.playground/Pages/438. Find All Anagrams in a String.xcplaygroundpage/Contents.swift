// 438. Find All Anagrams in a String
// https://leetcode.com/problems/find-all-anagrams-in-a-string/description/

class Solution {
    // BruteForce
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        guard p.count < s.count else { return [] }
        let s = Array(s)
        let p = Array(p)
        var result = [Int]()

        var charMap = [Character: Int]()
        for char in p {
            charMap[char, default: 0] += 1
        }

        func isAnagram(_ s: [Character], _ p: [Character]) -> Bool {
            var charMap = charMap

            for char in s {
                guard let val = charMap[char], val - 1 >= 0 else { return false }
                charMap[char, default: 0] -= 1
            }
            var isAnagram = true
            charMap.values.forEach {
                if $0 != 0 { isAnagram = false }
            }
            return isAnagram
        }

        for i in 0 ..< s.count - p.count + 1 {
            if isAnagram(Array(s[i ..< (i + p.count)]), p) {
                result.append(i)
            }
        }
        return result
    }

    // Sliding window
    func findAnagrams2(_ s: String, _ p: String) -> [Int] {
        guard s.count >= p.count else { return [] }
        let s = Array(s)
        let p = Array(p)
        let lenP = p.count
        var pHMap = [Character: Int]()
        var sHMap = [Character: Int]()
        var start = 0
        var result = [Int]()

        for char in p {
            pHMap[char, default: 0] += 1
        }

        for end in 0 ..< s.count {
            if pHMap[s[end]] == nil {
                while start < end {
                    if let val = sHMap[s[start]] {
                        sHMap[s[start]] = val - 1
                    }
                    start += 1
                }
                start += 1
            } else {
                sHMap[s[end], default: 0] += 1
                while end - start + 1 == lenP {
                    if sHMap == pHMap {
                        result.append(start)
                    }
                    if let val = sHMap[s[start]] {
                        sHMap[s[start]] = val - 1
                    }
                    start += 1
                }
            }
        }
        return result
    }
}
