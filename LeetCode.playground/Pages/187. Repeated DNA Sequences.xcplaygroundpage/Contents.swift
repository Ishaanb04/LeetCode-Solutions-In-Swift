// 187. Repeated DNA Sequences
// https://leetcode.com/problems/repeated-dna-sequences/description/

class Solution {
    func findRepeatedDnaSequences(_ s: String) -> [String] {
        guard s.count >= 10 else { return [] }
        let sArray = Array(s)
        var subSequenceHMap = [String: Int]()

        var start = 0

        for end in 9 ..< sArray.count {
            subSequenceHMap[String(sArray[start ... end]), default: 0] += 1
            start += 1
        }
        
        
        return Array(subSequenceHMap.enumerated().filter { $0.element.value > 1}.map{$0.element.key})
    }
}

var s = Solution()
print(s.findRepeatedDnaSequences("AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT"))
