class Solution {
    // 912. Sort an Array
    // https://leetcode.com/problems/sort-an-array/description/
    // MergeSort - O(nLogn) Time
    
    func sortArray(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else { return nums }
            
        // Merge Sequence of two sorted parts
        func mergeTwoSortedHalves(_ leftHalf: [Int], _ rightHalf: [Int]) -> [Int] {
            var sortedArray = [Int]()
                
            var index1 = 0
            var index2 = 0
                
            while index1 < leftHalf.count, index2 < rightHalf.count {
                if leftHalf[index1] < rightHalf[index2] {
                    sortedArray.append(leftHalf[index1])
                    index1 += 1
                } else {
                    sortedArray.append(rightHalf[index2])
                    index2 += 1
                }
            }
                
            if index1 < leftHalf.count {
                sortedArray.append(contentsOf: leftHalf[index1...])
            } else {
                sortedArray.append(contentsOf: rightHalf[index2...])
            }
            return sortedArray
        }
            
        // Recursive fuction
        func mergeSort(_ nums: [Int]) -> [Int] {
            guard nums.count > 1 else { return nums }
            let midIndex = nums.count / 2
            let left = mergeSort(Array(nums[0 ..< midIndex]))
            let right = mergeSort(Array(nums[midIndex ..< nums.count]))
                
            return mergeTwoSortedHalves(left, right)
        }
        return mergeSort(nums)
    }
    
    // 75. Sort Colors
    // https://leetcode.com/problems/sort-colors/description/
    
    func sortColors(_ nums: inout [Int]) {
        var startIndex = 0
        for index in 0 ..< nums.count {
            if nums[index] == 0 {
                nums.swapAt(startIndex, index)
                startIndex += 1
            }
        }
        
        var endIndex = nums.count - 1
        for index in stride(from: nums.count - 1, through: 0, by: -1) {
            if nums[index] == 2 {
                nums.swapAt(endIndex, index)
                endIndex -= 1
            }
        }
    }
}
