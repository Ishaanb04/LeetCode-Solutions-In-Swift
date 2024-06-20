// 76. Minimum Window Substring
// https://leetcode.com/problems/minimum-window-substring/description/

class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        guard s != t else { return s }
        guard s.count >= t.count else { return "" }
        var arrS = Array(s)
        var arrT = Array(t)
        var sHmap = [Character: Int]()
        var tHmap = [Character: Int]()
        var substring = [Int]()
        var minLength = Int.max
        for char in arrT {
            tHmap[char, default: 0] += 1
        }
        var required = tHmap.count
        var formed = 0
        var start = 0
        
        for end in 0 ..< arrS.count {
            sHmap[arrS[end], default: 0] += 1
            
            if let tVal = tHmap[arrS[end]], let sVal = sHmap[arrS[end]], sVal == tVal {
                formed += 1
            }
            while start <= end, formed == required {
                if end - start + 1 < minLength {
                    minLength = end - start + 1
                    substring = [start, end]
                }
                
                if let tVal = tHmap[arrS[start]], let sVal = sHmap[arrS[start]] {
                    sHmap[arrS[start]] = sVal - 1
                    if sVal - 1 < tVal {
                        formed -= 1
                    }
                }
                
                start += 1
            }
        }
        return substring.count == 2 ? String(arrS[substring[0] ... substring[1]]) : ""
    }
}

var s = Solution()
print(s.minWindow("ADOBECODEBANC", "ABC"))
