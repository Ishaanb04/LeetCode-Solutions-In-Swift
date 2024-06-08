// 2001. Number of Pairs of Interchangeable Rectangles
// https://leetcode.com/problems/number-of-pairs-of-interchangeable-rectangles/description/

class Solution {
    // Doesnt pass leetcode: Solution in tIME: O(n^2)
    func interchangeableRectangles(_ rectangles: [[Int]]) -> Int {
        var ratioArray = [Double]()

        for dimentions in rectangles {
            ratioArray.append(Double(dimentions[0]) / Double(dimentions[1]))
        }

        var result = 0
        for i in 0 ..< ratioArray.count {
            for j in (i + 1) ..< ratioArray.count {
                if ratioArray[i] == ratioArray[j] {
                    result += 1
                }
            }
        }
        return result
    }

    func interchangeableRectangles2(_ rectangles: [[Int]]) -> Int {
        var ratioHMap = [Double: Int]()
        var result = 0

        for dimentions in rectangles {
            ratioHMap[Double(dimentions[0]) / Double(dimentions[1]), default: 0] += 1
        }

        ratioHMap.values.forEach {
            result += ($0 * ($0 - 1)) / 2
        }
        return result
    }
}
