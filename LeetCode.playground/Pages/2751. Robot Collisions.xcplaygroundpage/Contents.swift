// 2751. Robot Collisions
// https://leetcode.com/problems/robot-collisions/?envType=daily-question&envId=2024-07-13

class Solution {
    func survivedRobotsHealths(_ positions: [Int], _ healths: [Int], _ directions: String) -> [Int] {
        var robots = [Robot]()
        var stack = [Robot]()
        var directions = Array(directions)
        for i in 0 ..< positions.count {
            robots.append(
                .init(index: i,
                      position: positions[i],
                      hp: healths[i],
                      direction: directions[i] == "R" ? .R : .L))
        }
        robots = robots.sorted { $0.position < $1.position }

        for robot in robots {
            if stack.isEmpty || stack.last!.direction == robot.direction {
                stack.append(robot)
            } else if stack.last!.direction == .R, robot.direction == .L {
                var robot = robot
                while !stack.isEmpty, stack.last!.direction == .R, robot.direction == .L {
                    var lastRobo = stack.removeLast()
                    if lastRobo.hp > robot.hp {
                        lastRobo.hp -= 1
                        robot = lastRobo
                    } else if lastRobo.hp < robot.hp {
                        robot.hp -= 1
                    } else {
                        robot.hp = 0
                        break
                    }
                }
                if robot.hp > 0 { stack.append(robot) }

            } else {
                stack.append(robot)
            }
        }
        stack = stack.sorted { $0.index < $1.index }
        var hpList = stack.map { $0.hp }
        return hpList
    }
}

enum RobotDirection {
    case R
    case L
}

struct Robot: Hashable {
    var index: Int
    var position: Int
    var hp: Int
    var direction: RobotDirection
}
