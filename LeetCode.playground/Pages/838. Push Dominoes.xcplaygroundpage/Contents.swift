// 838. Push Dominoes
// https://leetcode.com/problems/push-dominoes/description/

class Solution {
    func pushDominoes(_ dominoes: String) -> String {
        var dominoes = Array(dominoes)
        var left = Array(repeating: Int.max, count: dominoes.count)
        var right = Array(repeating: Int.max, count: dominoes.count)
        var counter = Int.max
        for i in stride(from: dominoes.count - 1, through: 0, by: -1) {
            if dominoes[i] == "L" {
                counter = 0
            } else if dominoes[i] == "R" {
                counter = Int.max
            }
            left[i] = counter
            if counter != Int.max {
                counter += 1
            }
        }

        for i in 0 ..< dominoes.count {
            if dominoes[i] == "R" {
                counter = 0
            } else if dominoes[i] == "L" {
                counter = Int.max
            }
            right[i] = counter
            if counter != Int.max {
                counter += 1
            }
        }

        
        for i in 0 ..< left.count {
            if left[i] < right[i] {
                dominoes[i] = "L"
            } else if left[i] > right[i] {
                dominoes[i] = "R"
            }
        }
        return String(dominoes)
    }

    func pushDominoes2(_ dominoes: String) -> String {
        var dominoes: [Character] = Array(dominoes)
        var queue = [(Int, Character)]()

        for (index, char) in dominoes.enumerated() {
            if char != "." {
                queue.append((index, char))
            }
        }
        while !queue.isEmpty {
            let node = queue.removeFirst()
            let index = node.0
            let char = node.1
            if char == "L", index > 0, dominoes[index - 1] == "." {
                dominoes[index - 1] = "L"
                queue.append((index - 1, "L"))
            } else if char == "R", index + 1 < dominoes.count, dominoes[index + 1] == "." {
                if index + 2 == dominoes.count {
                    dominoes[index + 1] = "R"
                } else if index + 2 < dominoes.count, dominoes[index + 2] != "L" {
                    dominoes[index + 1] = "R"
                    queue.append((index + 1, "R"))
                } else if index + 2 < dominoes.count, dominoes[index + 2] == "L" {
                    queue.removeFirst()
                }
            }
        }

        return dominoes.map { "\($0)" }.joined()
    }
}
