// 2002. Maximum Product of the Length of Two Palindromic Subsequences
// https://leetcode.com/problems/maximum-product-of-the-length-of-two-palindromic-subsequences/description/

class Solution {
    func maxProduct(_ s: String) -> Int {
        let length = s.count
        let arr = Array(s)
        var subSeqHMap = [Int: Int]()
        // Create a Bitmask for all possiblities
        for mask in 1 ..< (1 << length) {
            var subSequence = [Character]()
            // Going through all possible char in string and
            // doing a bitwise AND, to see if the char is occupied
            for i in 0 ..< arr.count {
                if mask & (1 << i) != 0 {
                    subSequence.append(arr[i])
                }
                if subSequence == subSequence.reversed() {
                    subSeqHMap[mask] = subSequence.count
                }
            }
        }

        var maxProd = 0

        subSeqHMap.forEach { sub1 in
            subSeqHMap.forEach { sub2 in
                if sub1.key & sub2.key == 0 {
                    maxProd = max(maxProd, sub1.value * sub2.value)
                }
            }
        }
        return maxProd
    }
}
