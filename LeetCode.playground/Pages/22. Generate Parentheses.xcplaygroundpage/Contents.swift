// 22. Generate Parentheses
// https://leetcode.com/problems/generate-parentheses/description/

class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var substring = [Character]()
        var result = [String]()
        
        func backtrack(_ opening: Int, _ closing: Int) {
            if opening == closing, closing == n {
                result.append(String(substring))
            }
            
            if opening < n {
                substring.append("(")
                backtrack(opening + 1, closing)
                substring.removeLast()
            }
            
            if closing < opening {
                substring.append(")")
                backtrack(opening, closing + 1)
                substring.removeLast()
            }
        }
        
        backtrack(0, 0)
        return result
    }
}
