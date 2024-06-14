// 2405. Optimal Partition of String
// https://leetcode.com/problems/optimal-partition-of-string/description/

class Solution {
    func partitionString(_ s: String) -> Int {
        var stringSet = Set<Character>()
        var stringArr = Array(s)
        var result = 0
        for index in 0 ..< stringArr.count {
            if !stringSet.contains(stringArr[index]) {
                stringSet.insert(stringArr[index])
            } else {
                result += 1
                stringSet = Set<Character>()
                stringSet.insert(stringArr[index])
            }
        }
        return stringSet.count == 0 ? result : result + 1
    }
    
    func partitionString2(_ s: String) -> Int {
        var lastSeenArr = Array(repeating: -1, count: 26)
        var substringStart = 0
        var result = 0
        for (index, char) in s.enumerated() {
            let i = Int(char.asciiValue! - Character("a").asciiValue!)
            if lastSeenArr[i] >= substringStart {
                result += 1
                substringStart = index
            }
            lastSeenArr[i] = index
        }
        return result
    }
}
