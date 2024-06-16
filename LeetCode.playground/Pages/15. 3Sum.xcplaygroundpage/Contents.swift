// 15. 3Sum
// https://leetcode.com/problems/3sum/description/

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var sortedList = nums.sorted { $0 < $1 }
        var output = [[Int]]()
        for start in 0 ..< sortedList.count {
            if start > 0, sortedList[start - 1] == sortedList[start] {
                continue
            }
            var i = start + 1
            var j = sortedList.count - 1
            while i < j {
                var target = sortedList[start] + sortedList[i] + sortedList[j]
                if target == 0 {
                    output.append([sortedList[start], sortedList[i], sortedList[j]])
                    while i < j, sortedList[i] == sortedList[i + 1] { i += 1 }
                    while i < j, sortedList[j - 1] == sortedList[j] { j -= 1 }
                    i += 1
                    j -= 1
                } else if target < 0 {
                    i += 1
                } else {
                    j -= 1
                }
            }
        }
        return output
    }
}
