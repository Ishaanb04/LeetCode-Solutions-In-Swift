//127. Word Ladder
//https://leetcode.com/problems/word-ladder/description/
class Solution {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        var wordList = Set(wordList.map { Array($0) })
        var endWord = Array(endWord)
        var beginWord = Array(beginWord)
        var queue = [([Character], Int)]()
        var visited = Set<[Character]>()
        var minDistance = 0

        guard wordList.contains(endWord) else { return 0 }
        queue.append((beginWord, 0))
        
        while !queue.isEmpty {
            let queueLen = queue.count
            minDistance += 1
            for _ in 0 ..< queueLen {
                let node = queue.removeFirst()
                let word = node.0
                if word == endWord { return node.1 + 1 }
                if !visited.contains(word) {
                    visited.insert(word)
                    isConnection(word, node.1)
                }
            }
        }
        return 0
        func isConnection(_ word: [Character], _ currDistance: Int) {
            for i in 0 ..< word.count {
                for unicodeValue in 97 ... 122 {
                    if let scalar = UnicodeScalar(unicodeValue) {
                        let char = Character(scalar)
                        var newWord = word
                        newWord[i] = char
                        if wordList.contains(newWord) {
                            queue.append((newWord, currDistance + 1))
                        }
                    }
                }
            }
        }
    }
}
