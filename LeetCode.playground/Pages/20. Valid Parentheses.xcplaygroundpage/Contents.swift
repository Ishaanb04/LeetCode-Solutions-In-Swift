//20. Valid Parentheses
//https://leetcode.com/problems/valid-parentheses/description/

class Solution {
    func isValid(_ s: String) -> Bool {
        var charhMap: [Character: Character] = [
            "]": "[",
            "}": "{",
            ")": "("
        ]
        var stack = [Character]()

        for char in s {
            if let val = charhMap[char] {
                if stack.isEmpty || stack.removeLast() != val { return false }
            } else {
                stack.append(char)
            }
        }
        return stack.count == 0
    }
}
