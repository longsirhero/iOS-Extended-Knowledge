import UIKit

var str = "Hello, playground"

var groups = [[String]]()

var groupA = ["England", "Ireland", "Scotland", "Wales"]
var groupB = ["Canada", "Mexico", "United States"]
var groupC = ["China", "Japan", "South Korea"]

groups.append(groupA)
groups.append(groupB)
groups.append(groupC)

print("The groups are:", groups)
groups[1].append("Costa Rica")
print("\nAfter adding Costa Rica, the groups are:", groups)
// print()由于数组的值类型行为，最后一条语句仍将打印出["Canada", "Mexico", "United States"]：我们修改了内部数组的副本groups，而不是groupB。
print("\nGroup B still contains:", groupB)




