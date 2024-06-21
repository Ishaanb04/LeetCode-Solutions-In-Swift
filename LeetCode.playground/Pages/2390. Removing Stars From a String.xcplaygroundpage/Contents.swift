// 2390. Removing Stars From a String
// https://leetcode.com/problems/removing-stars-from-a-string/

class Solution {
    func removeStars(_ s: String) -> String {
        var stack = [Character]()

        for char in s {
            if !stack.isEmpty, char == "*" {
                stack.removeLast()
            } else {
                stack.append(char)
            }
        }
        return String(stack)
    }
}

var s = Solution()
print(s.removeStars("leet**cod*e"))
