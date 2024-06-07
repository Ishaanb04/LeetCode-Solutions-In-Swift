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
}
