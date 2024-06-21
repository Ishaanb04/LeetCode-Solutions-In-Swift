// https://leetcode.com/problems/decode-string/
// 394. Decode String

class Solution {
    func decodeString(_ s: String) -> String {
        var stack = [String]()
        for char in s {
            if char != "]" {
                stack.append(String(char))
            } else {
                var subString = ""
                while !stack.isEmpty, stack.last! != "[" {
                    subString = "\(stack.removeLast())\(subString)"
                }
                stack.removeLast()
                var num = ""
                while !stack.isEmpty, Character(stack.last!).isNumber {
                    num = "\(stack.removeLast())\(num)"
                }
                var count = Int(num)!
                stack.append(Array(repeating: subString, count: count).joined())
            }
        }
        return stack.joined()
    }
}
