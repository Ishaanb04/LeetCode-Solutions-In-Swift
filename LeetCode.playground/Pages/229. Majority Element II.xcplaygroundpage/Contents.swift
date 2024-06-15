// 229. Majority Element II
// https://leetcode.com/problems/majority-element-ii/description/

class Solution {
    // Space and Time: O(n)
    func majorityElement(_ nums: [Int]) -> [Int] {
        var hmap = [Int: Int]()
        var length = nums.count
        var output = [Int]()
        for num in nums {
            hmap[num, default: 0] += 1
            if let val = hmap[num], val > (length / 3) {
                output.append(num)
            }
        }
        return output
    }
    
    // Time: O(n) and Space: O(1)
    func majorityElement2(_ nums: [Int]) -> [Int] {
        var hmap = [Int: Int]()
        var output = [Int]()
        for num in nums {
            hmap[num, default: 0] += 1
            
            if hmap.count > 2 {
                var newHmap = [Int: Int]()
                for (key, val) in hmap {
                    if val - 1 != 0 {
                        newHmap[key] = val - 1
                    }
                }
                hmap = newHmap
            }
        }
        
        hmap.forEach { key, _ in
            if nums.filter { $0 == key }.count > (nums.count / 3) { output.append(key) }
        }
        return output
    }
}
