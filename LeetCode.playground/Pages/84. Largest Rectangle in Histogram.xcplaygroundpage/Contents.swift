// 84. Largest Rectangle in Histogram
// https://leetcode.com/problems/largest-rectangle-in-histogram/description/

class Solution {
    func largestRectangleAreaBruteForce(_ heights: [Int]) -> Int {
        var currentMax = 0
        for i in 0 ..< heights.count {
            var currentMin = Int.max
            for j in i ..< heights.count {
                currentMin = min(currentMin, heights[j])
                currentMax = max(currentMax, currentMin * (j - i + 1))
            }
        }
        return currentMax
    }

    func largestRectangleArea(_ heights: [Int]) -> Int {
        var stack = [(Int, Int)]() // Index: Height
        var maxArea = 0
        for (i, height) in heights.enumerated() {
            if stack.isEmpty || height >= stack.last!.1 {
                stack.append((i, height))
            } else {
                var index = -1
                while !stack.isEmpty, stack.last!.1 > height {
                    let lastElem = stack.removeLast()
                    maxArea = max(maxArea, lastElem.1 * (i - lastElem.0))
                    index = lastElem.0
                }
                stack.append((index == -1 ? 0 : index, height))
            }
            print(stack, maxArea)
        }
        stack.forEach{ element in
            maxArea = max(maxArea, (heights.count - element.0) * element.1 )
        }
        return maxArea
    }
}

