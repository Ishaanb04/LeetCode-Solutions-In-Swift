// 726. Number of Atoms
// https://leetcode.com/problems/number-of-atoms/description/?envType=daily-question&envId=2024-07-14

class Solution {
    func countOfAtoms(_ formula: String) -> String {
        var mults = [Int]()
        var multiplier = 1
        var counts = [String: Int]()
        var i = formula.count - 1
        let formula = Array(formula)
        var num = 1
        while i >= 0 {
            let char = formula[i]
            if char.isNumber {
                var j = i
                while formula[j].isNumber {
                    j -= 1
                }
                let temp = Int(String(formula[(j + 1)...i]))!
                if formula[j] == ")" {
                    mults.append(temp)
                    multiplier *= temp
                    i = j - 1
                } else {
                    num = temp
                    i = j
                }
            } else if char == "(" {
                multiplier /= mults.popLast() ?? 1
                i -= 1
            } else if char != ")" {
                var j = i
                while formula[j].isLowercase {
                    j -= 1
                }
                let str = String(formula[j...i])
                i = j - 1
                counts[str, default: 0] += num * multiplier
                num = 1
            } else {
                i -= 1
            }
        }

        return counts.keys.sorted().map { "\($0)" + (counts[$0]! > 1 ? "\(counts[$0]!)" : "") }.joined()
    }
}
