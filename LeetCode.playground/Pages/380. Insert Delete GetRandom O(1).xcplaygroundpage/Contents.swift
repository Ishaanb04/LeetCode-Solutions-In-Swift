// 380. Insert Delete GetRandom O(1)
// https://leetcode.com/problems/insert-delete-getrandom-o1/description/

class RandomizedSet {
    var rSet: Set<Int>
    init() {
        self.rSet = Set<Int>()
    }

    func insert(_ val: Int) -> Bool {
        if rSet.contains(val) {
            return false
        } else { rSet.insert(val)
            return true
        }
    }

    func remove(_ val: Int) -> Bool {
        if rSet.contains(val) {
            rSet.remove(val)
            return true
        } else {
            return false
        }
    }

    func getRandom() -> Int {
        return rSet.randomElement() ?? -1
    }
}

/**
 * Your RandomizedSet object will be instantiated and called as such:
 * let obj = RandomizedSet()
 * let ret_1: Bool = obj.insert(val)
 * let ret_2: Bool = obj.remove(val)
 * let ret_3: Int = obj.getRandom()
 */
