// 150. Evaluate Reverse Polish Notation
// https://leetcode.com/problems/evaluate-reverse-polish-notation/description/

class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var stack = [Int]()
        var tokens = Array(tokens)
        for token in tokens {
            if token == "+" {
                stack.append(stack.removeLast() + stack.removeLast())
            } else if token == "-" {
                let first = stack.removeLast()
                let second = stack.removeLast()
                stack.append(second - first)
            } else if token == "*" {
                stack.append(stack.removeLast() * stack.removeLast())
            } else if token == "/" {
                let first = stack.removeLast()
                let second = stack.removeLast()
                stack.append(second / first)
            } else {
                stack.append(Int(token))
            }
        }
        return stack[0]
    }
}
