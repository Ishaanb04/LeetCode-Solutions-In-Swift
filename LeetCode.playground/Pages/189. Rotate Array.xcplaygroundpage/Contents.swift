// 189. Rotate Array
// https://leetcode.com/problems/rotate-array/description/

class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        guard nums.count > 1 else { return }
        var rotations = k % nums.count
        guard rotations != 0 else { return }

        func reverseRange(_ start: Int, _ end: Int) {
            var start = start
            var end = end

            while start < end {
                nums.swapAt(start, end)
                start += 1
                end -= 1
            }
        }
        reverseRange(0, nums.count - 1)
        reverseRange(0, rotations - 1)
        reverseRange(rotations, nums.count - 1)
    }
}
