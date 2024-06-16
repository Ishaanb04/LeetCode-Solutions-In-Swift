// 18. 4Sum
// https://leetcode.com/problems/4sum/description/

class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        var sortedList = nums.sorted { $0 < $1 }
        var output = [[Int]]()
        for s in 0 ..< sortedList.count {
            if s > 0, sortedList[s - 1] == sortedList[s] {
                continue
            }
            var start = s + 1
            while start < sortedList.count {
                if start > s + 1, sortedList[start - 1] == sortedList[start] {
                    start += 1
                    continue
                }
                var i = start + 1
                var j = sortedList.count - 1
                while i < j {
                    var t = sortedList[s] + sortedList[start] + sortedList[i] + sortedList[j]
                    if t == target {
                        output.append([sortedList[s], sortedList[start], sortedList[i], sortedList[j]])
                        while i < j, sortedList[i] == sortedList[i + 1] { i += 1 }
                        while i < j, sortedList[j - 1] == sortedList[j] { j -= 1 }
                        i += 1
                        j -= 1
                    } else if t < target {
                        i += 1
                    } else {
                        j -= 1
                    }
                }
                start += 1
            }
        }
        return output
    }
}
