// 74. Search a 2D Matrix
// https://leetcode.com/problems/search-a-2d-matrix/description/

class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        var left = 0
        var right = (matrix.count * matrix[0].count) - 1

        while left <= right {
            var mid = left + (right - left) / 2
            let row = mid / matrix[0].count
            let col = mid % matrix[0].count
            let value = matrix[row][col]

            if value == target {
                return true
            } else if value < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return false
    }
}
