// 239. Sliding Window Maximum
// https://leetcode.com/problems/sliding-window-maximum/description/

class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        var deque = [Int]()
        var output = [Int]()
        var start = 0
        for end in 0 ..< nums.count {
            while !deque.isEmpty, nums[end] >= nums[deque[deque.count - 1]] {
                deque.remove(at: deque.count - 1)
            }
            deque.append(end)

            if end - start + 1 == k {
                output.append(nums[deque[0]])

                if deque[0] == start {
                    deque.removeFirst()
                }
                start += 1
            }
        }
        return output
    }
}
