// 1930. Unique Length-3 Palindromic Subsequences
// https://leetcode.com/problems/unique-length-3-palindromic-subsequences/description/

class Solution {
    // Time: O(n^2): Doesnt pass leetcode, time limit is exeeded
    func countPalindromicSubsequence(_ s: String) -> Int {
        let string = Array(s)
        var set = Set<[Character]>()
        for index in 0 ..< string.count - 2 {
            if index > 0, string[index - 1] == string[index] {
                continue
            }
            var start = index + 1
            var end = string.count - 1

            while start < end {
                if string[index] == string[end] {
                    set.insert([string[index], string[start], string[end]])
                    start += 1
                } else {
                    end -= 1
                }
            }
        }
        return set.count
    }

    // Counting Letters in between the first and last position of charecter
    func countPalindromicSubsequence2(_ s: String) -> Int {
        let letters = Set(s)
        let arrayS = Array(s)
        var result = 0
        for letter in letters {
            if let leftIndex = arrayS.firstIndex(of: letter),
               let rightIndex = arrayS.lastIndex(of: letter),
               leftIndex < rightIndex
            {
                var betweenSet = Set<Character>()
                for index in (leftIndex + 1) ..< rightIndex {
                    betweenSet.insert(arrayS[index])
                }
                result += betweenSet.count
            }
        }
        return result
    }

    // Preprocessing First and last Index
    func countPalindromicSubsequence3(_ s: String) -> Int {
        var firstIndex = Array(repeating: -1, count: 26)
        var lastIndex = Array(repeating: -1, count: 26)
        let arrayS = Array(s)
        var result = 0
        for (idx, char) in s.enumerated() {
            let index = Int(char.asciiValue! - Character("a").asciiValue!)
            if firstIndex[index] == -1 {
                firstIndex[index] = idx
            }
            lastIndex[index] = idx
        }

        for (idx, pos) in firstIndex.enumerated() {
            if pos != -1, pos < lastIndex[idx] {
                var betweenSet = Set<Character>()
                for index in (pos + 1) ..< lastIndex[idx] {
                    betweenSet.insert(arrayS[index])
                }
                result += betweenSet.count
            }
        }
        return result
    }
}
