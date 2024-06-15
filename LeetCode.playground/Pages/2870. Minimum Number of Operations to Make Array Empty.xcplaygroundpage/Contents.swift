// 2870. Minimum Number of Operations to Make Array Empty
// https://leetcode.com/problems/minimum-number-of-operations-to-make-array-empty/description/
import Foundation
class Solution {
    func minOperations(_ nums: [Int]) -> Int {
           var operationCount = 0
            var hmap = [Int: Int]()

            func computeOperation(_ val: Int) -> Int {
                var val = val
                var operations = 0
                while val > 0 {
                    if val % 3 == 0 {
                        operations += val / 3
                        return operations
                    } else {
                        val -= 2
                        operations += 1
                    }
                }
                return val == 0 ? operations : -1
            }

            for num in nums {
                hmap[num, default: 0] += 1
            }
            for (_, val) in hmap {
                var op = computeOperation(val)
                if op == -1 {return op}
                operationCount += op
            }
            return operationCount
        }

    func minOperations2(_ nums: [Int]) -> Int {
        var operationCount = 0
        var hmap = [Int: Int]()

        for num in nums {
            hmap[num, default: 0] += 1
        }
        for c in hmap.values {
            if c == 1 {
                return -1
            }
            operationCount += Int(ceil(Double(c) / Double(3)))
        }
        return operationCount
    }
}
