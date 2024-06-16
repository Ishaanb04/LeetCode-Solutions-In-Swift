// 451. Sort Characters By Frequency
// https://leetcode.com/problems/sort-characters-by-frequency/
class Solution {
    func frequencySort(_ s: String) -> String {
        var frequencyMap = [Character: [Character]]()
        for char in s {
            frequencyMap[char, default: []].append(char)
        }

        return frequencyMap.sorted{$0.value.count > $1.value.count}.reduce("", { $0 + $1.value})
    }
}
