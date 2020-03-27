//
//  EasyViewController.swift
//  AlgorithmPractice
//
//  Created by 刘汤圆 on 2020/3/9.
//  Copyright © 2020 刘汤圆. All rights reserved.
//

import UIKit

class EasyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        /* 旋转数组
        var arr = [1,2,3,4,5,6,7]
        rotate(&arr, 3)
        */
        print(twoSum([2,2,4,6], 10))
//        print(minIncrementForUnique([1,2,4,4,6,6,3]))
//        print(middleNode([1,2,3,4,5,6]))
        
        print(reverse(1534236469))
    }
    // MARK: 整数反转 2020.3.27
    func reverse(_ x: Int) -> Int {
        if x == 0 { return 0 }
        var rev = 0
        var num = x
        while num != 0 {
            let a = num % 10
            num = num / 10
            rev = rev * 10 + a
        }
        if rev > Int32.max || rev < Int32.min {
            return 0
        }
        return rev
    }
    // MARK: 链表的中间结点 2020.03.23
    /*
     给定一个带有头结点 head 的非空单链表，返回链表的中间结点。
     如果有两个中间结点，则返回第二个中间结点。

     示例 1：
     输入：[1,2,3,4,5]
     输出：此列表中的结点 3 (序列化形式：[3,4,5])
     返回的结点值为 3 。 (测评系统对该结点序列化表述是 [3,4,5])。
     注意，我们返回了一个 ListNode 类型的对象 ans，这样：
     ans.val = 3, ans.next.val = 4, ans.next.next.val = 5, 以及 ans.next.next.next = NULL.
     
     示例 2：
     输入：[1,2,3,4,5,6]
     输出：此列表中的结点 4 (序列化形式：[4,5,6])
     由于该列表有两个中间结点，值分别为 3 和 4，我们返回第二个结点。
      
     提示：
     给定链表的结点数介于 1 和 100 之间。
     */
    func middleNode(_ head: ListNode?) -> ListNode? {
        var slow = head
        var fast = head
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        return slow
    }
    // MARK: 使数组唯一的最小增量 2020.03.22
    /*
     给定整数数组 A，每次 move 操作将会选择任意 A[i]，并将其递增 1。
     返回使 A 中的每个值都是唯一的最少操作次数。

     示例 1:
     输入：[1,2,2]
     输出：1
     解释：经过一次 move 操作，数组将变为 [1, 2, 3]。
     
     示例 2:
     输入：[3,2,1,2,1,7]
     输出：6
     解释：经过 6 次 move 操作，数组将变为 [3, 4, 1, 2, 5, 7]。
     可以看出 5 次或 5 次以下的 move 操作是不能让数组的每个值唯一的。
     
     提示：0 <= A.length <= 40000; 0 <= A[i] < 40000
     */
    func minIncrementForUnique(_ A: [Int]) -> Int {
        if A.count < 2  || A.count > 40000 { return 0 }
        // 1.数组排序，根据数组是否重复分成两个组。
        // 2.遍历数字重复的数组，+1，再判断数字不重复的数组中是否包含这个值。若有，继续+1，若没有，将该值加入数字不重复数组
        // 3.记录操作次数，直到数字重复的数组为空。    时间复杂度太高，会超时。
        
        var sortA = A.sorted()
        var moveCount = 0
        for i in 1..<sortA.count {
            if sortA[i] <= sortA[i-1] {
                moveCount += sortA[i-1] - sortA[i] + 1
                sortA[i] = sortA[i-1] + 1
            }
        }
        return moveCount
    }
    // MARK: 字母异位词分组 2020.03.20
    /*
     给定一个字符串数组，将字母异位词组合在一起。字母异位词指字母相同，但排列不同的字符串。
     示例:
     输入: ["eat", "tea", "tan", "ate", "nat", "bat"],
     输出:
     [
       ["ate","eat","tea"],
       ["nat","tan"],
       ["bat"]
     ]
     说明：
     所有输入均为小写字母。
     不考虑答案输出的顺序。
     */
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        if strs.count == 0 { return [] }
        var result = [String: [String]]()
        for str in strs {
            let sort_str = String(Array(str).sorted())
            if !result.keys.contains(sort_str) {
                result[sort_str] = [String]()
            }
            result[sort_str]?.append(str)
        }
        return Array(result.values)
        
    }
    // MARK: 数组中的第K个最大元素 2020.03.20
    /*
     在未排序的数组中找到第 k 个最大的元素。请注意，你需要找的是数组排序后的第 k 个最大的元素，而不是第 k 个不同的元素。
     示例 1:
     输入: [3,2,1,5,6,4] 和 k = 2
     输出: 5
     
     示例 2:
     输入: [3,2,3,1,2,4,5,5,6] 和 k = 4
     输出: 4
     
     说明:
     你可以假设 k 总是有效的，且 1 ≤ k ≤ 数组的长度。
     */
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        let new_nums = nums.sorted { (i, j) -> Bool in
            i > j
        }
        print(new_nums)
        return new_nums[k-1]
    }
    // MARK: 面试题40. 最小的k个数 2020.03.20
    /*
     输入整数数组 arr ，找出其中最小的 k 个数。例如，输入4、5、1、6、2、7、3、8这8个数字，则最小的4个数字是1、2、3、4。

     示例 1：
     输入：arr = [3,2,1], k = 2
     输出：[1,2] 或者 [2,1]
     
     示例 2：
     输入：arr = [0,1,2,1], k = 1
     输出：[0]
      
     限制：
     0 <= k <= arr.length <= 10000
     0 <= arr[i] <= 10000
     */
    func getLeastNumbers(_ arr: [Int], _ k: Int) -> [Int] {
        if k > arr.count { return [] }
        let sortArr = arr.sorted()
        var finalArr:[Int] = Array()
        for i in 0..<k {
            finalArr.append(sortArr[i])
        }
        return finalArr
    }
    // MARK: 最长回文串 2020.03.19
    /*
     给定一个包含大写字母和小写字母的字符串，找到通过这些字母构造成的最长的回文串。
     在构造过程中，请注意区分大小写。比如 "Aa" 不能当做一个回文字符串。

     注意:假设字符串的长度不会超过 1010。

     示例 1:
     输入:
     "abccccdd"
     输出:
     7
     解释:
     我们可以构造的最长的回文串是"dccaccd", 它的长度是 7。
     */
    func longestPalindrome(_ s: String) -> Int {
        var dic:[Character: Int] = Dictionary()
        if s.count == 0 || s.count == 1 {
            return s.count
        }
        for c in s {
            if let i = dic[c] {
                dic[c] = i + 1
            } else {
                dic[c] = 1
            }
        }
        let countArr = dic.values
        let o = countArr.filter {  $0 % 2 == 0 }
        let j = countArr.filter {  $0 % 2 != 0 }
        // 如果字母全是偶数个 ，全都可用
        if o.count != 0 && j.count == 0 {
            var length = 0
            for i in o {
                length+=i
            }
            return length
        } else if o.count == 0 && j.count != 0 {
            var length = 0
            for i in j {
                length = length + i - 1
            }
            return length + 1
        }else {
            var length1 = 0
            for i in o {
                length1+=i
            }
            let arr1 = j.filter {  $0 != 1 }
            let arr2 = j.filter {  $0 == 1 }
            if arr1.count == 0 && arr2.count != 0 {
                return length1 + 1
            } else if arr1.count != 0 && arr2.count == 0 {
                var len2 = 0
                for i in arr1 {
                    len2 = len2 + i - 1
                }
                return length1 + len2 + 1
            } else {
                var len2 = 0
                for i in arr1 {
                    len2 = len2 + i - 1
                }
                return length1 + len2 + 1
            }
        }
    }
    // MARK: 多数元素 2020.03.19
    /*
     给定一个大小为 n 的数组，找到其中的多数元素。多数元素是指在数组中出现次数大于 ⌊ n/2 ⌋ 的元素。
     你可以假设数组是非空的，并且给定的数组总是存在多数元素。
     示例 1:
     输入: [3,2,3]
     输出: 3
     
     示例 2:
     输入: [2,2,1,1,1,2,2]
     输出: 2
     */
    func majorityElement(_ nums: [Int]) -> Int {
        var dic:[Int: Int] = Dictionary()
        var count = 0
        var result = 0
        for item in nums {
            if let i = dic[item] {
                dic[item] = i + 1
            } else {
                dic[item] = 1
            }
            if dic[item]! > count {
                count = dic[item]!
                result = item
            }
        }
        return result
    }
    // MARK:  矩形重叠 2020.03.18
    /*
     矩形以列表 [x1, y1, x2, y2] 的形式表示，其中 (x1, y1) 为左下角的坐标，(x2, y2) 是右上角的坐标。
     如果相交的面积为正，则称两矩形重叠。需要明确的是，只在角或边接触的两个矩形不构成重叠。
     给出两个矩形，判断它们是否重叠并返回结果。

     示例 1：
     输入：rec1 = [0,0,2,2], rec2 = [1,1,3,3]
     输出：true
     
     示例 2：
     输入：rec1 = [0,0,1,1], rec2 = [1,0,2,1]
     输出：false
      
     提示：
     两个矩形 rec1 和 rec2 都以含有四个整数的列表的形式给出。
     矩形中的所有坐标都处于 -10^9 和 10^9 之间。
     x 轴默认指向右，y 轴默认指向上。
     你可以仅考虑矩形是正放的情况。
     */
    func isRectangleOverlap(_ rec1: [Int], _ rec2: [Int]) -> Bool {
        // rec1右上角x <= rec2左上角x || rec1左上角x >= rec2右上角x
        let x_over = rec1[2] <= rec2[0] || rec1[0] >= rec2[2]
        // rec1右上角y <= rec2左上角y || rec1左下角y >= rec2右下角y
        let y_over = rec1[3] <= rec2[1] || rec1[1] >= rec2[3]
        return !(x_over || y_over)
    }
    // MARK: 合并两个有序链表 2020.03.17
    /*
     将两个有序链表合并为一个新的有序链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。
     示例：
     输入：1->2->4, 1->3->4
     输出：1->1->2->3->4->4
     */
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil {
            return l2
        }
        if l2 == nil {
            return l1
        }
        var result: ListNode? = nil
        if l1!.val <= l2!.val {
            result = l1
            result!.next = mergeTwoLists(l1?.next, l2)
        } else {
            result = l2
            result!.next = mergeTwoLists(l1, l2?.next)
        }
        return result
    }
    // MARK: 删除排序数组中的重复项 2020.03.16
    /*
     给定一个排序数组，你需要在 原地 删除重复出现的元素，使得每个元素只出现一次，返回移除后数组的新长度。
     不要使用额外的数组空间，你必须在 原地 修改输入数组 并在使用 O(1) 额外空间的条件下完成。

     示例 1:
     给定数组 nums = [1,1,2],
     函数应该返回新的长度 2, 并且原数组 nums 的前两个元素被修改为 1, 2。
     你不需要考虑数组中超出新长度后面的元素。
     
     示例 2:
     给定 nums = [0,0,1,1,1,2,2,3,3,4],
     函数应该返回新的长度 5, 并且原数组 nums 的前五个元素被修改为 0, 1, 2, 3, 4。
     你不需要考虑数组中超出新长度后面的元素。
      
     说明:
     为什么返回数值是整数，但输出的答案是数组呢?
     请注意，输入数组是以「引用」方式传递的，这意味着在函数里修改输入数组对于调用者是可见的。

     你可以想象内部操作如下:
     int len = removeDuplicates(nums);// nums 是以“引用”方式传递的。也就是说，不对实参做任何拷贝

     // 在函数里修改输入数组对于调用者是可见的。
     // 根据你的函数返回的长度, 它会打印出数组中该长度范围内的所有元素。
     for (int i = 0; i < len; i++) {
         print(nums[i]);
     }
     
     ps: 若数组中没有重复元素，按照上面的方法，每次比较时 nums[p] 都不等于 nums[q]，因此就会将 q 指向的元素原地复制一遍，这个操作其实是不必要的。
     因此我们可以添加一个小判断，当 q - p > 1 时，才进行赋值。
     */
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count < 2 { return nums.count }
        var i = 0, j = 1
        while j < nums.count {
            if nums[i] == nums[j] {
                j+=1
            } else {
                nums[i+1] = nums[j] //当 q - p > 1 时，才进行赋值
                i+=1
                j+=1
            }
        }
        print(nums)
        return i + 1
    }
    // MARK: 合并两个有序数组 2020.03.13
    /*
     给你两个有序整数数组 nums1 和 nums2，请你将 nums2 合并到 nums1 中，使 num1 成为一个有序数组。
     说明:
     初始化 nums1 和 nums2 的元素数量分别为 m 和 n 。
     你可以假设 nums1 有足够的空间（空间大小大于或等于 m + n）来保存 nums2 中的元素。

     示例:
     输入:
     nums1 = [1,2,3,0,0,0], m = 3
     nums2 = [2,5,6],       n = 3
     输出: [1,2,2,3,5,6]
     */
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        nums1.removeSubrange(m..<nums1.count)
        nums1 = nums1 + nums2
        nums1 = nums1.sorted()
    }
    // MARK: 移动零 2020.03.12
    /*
     *给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。
     示例:
     输入: [0,1,0,3,12]
     输出: [1,3,12,0,0]
     说明:
     必须在原数组上操作，不能拷贝额外的数组。尽量减少操作次数。
     */
    func moveZeroes(_ nums: inout [Int]) {
        if nums.count < 1 { return }
        var j = 0 // 记录非0的个数
        for i in 0..<nums.count {
            if nums[i] != 0 {
                nums[j] = nums[i]
                j+=1
            }
        }
        for zero in j..<nums.count {
            nums[zero] = 0
        }
    }
    // MARK: 旋转数组 2020.03.11
    /*
     给定一个数组，将数组中的元素向右移动 k 个位置，其中 k 是非负数。

     示例 1:
     输入: [1,2,3,4,5,6,7] 和 k = 3
     输出: [5,6,7,1,2,3,4]
     解释:
     向右旋转 1 步: [7,1,2,3,4,5,6]
     向右旋转 2 步: [6,7,1,2,3,4,5]
     向右旋转 3 步: [5,6,7,1,2,3,4]
     
     示例 2:
     输入: [-1,-100,3,99] 和 k = 2
     输出: [3,99,-1,-100]
     解释:
     向右旋转 1 步: [99,-1,-100,3]
     向右旋转 2 步: [3,99,-1,-100]
     */
    func rotate(_ nums: inout [Int], _ k: Int) {
        // inout 表明这个参数 在函数里面是可以修改掉外面的
        // 外部传参的时候 需要传可变参数
        if nums.count < 1 { return }
        var i = k
        while i > 0 {
            let last = nums.last!
            nums.insert(last, at: 0)
            nums.removeLast()
            i-=1
        }
        print(nums)
    }
    // MARK: 加一 2020.03.11
     /*（如果直接把string转int，会有溢出，超过32位之后就无法成功转化）
     *给定一个由整数组成的非空数组所表示的非负整数，在该数的基础上加一。
     最高位数字存放在数组的首位， 数组中每个元素只存储单个数字。
     你可以假设除了整数 0 之外，这个整数不会以零开头。

     示例 1:
     输入: [1,2,3]
     输出: [1,2,4]
     解释: 输入数组表示数字 123。
     
     示例 2:
     输入: [4,3,2,1]
     输出: [4,3,2,2]
     解释: 输入数组表示数字 4321。
     */
    func plusOne(_ digits: [Int]) -> [Int] {
        var digitArr = digits
        if digits.count < 1 { return digits }
        // 1. 如果末位加上1小于10，则直接返回
        let last = digits.last!
        if (last + 1) < 10 {
            digitArr[digitArr.count-1] = last + 1
            return digitArr
        } else {
            // 2. 如果末位加上1大于9，则轮询位数
            let i = digitArr.count-1
            digitArr[i] = 0
            if digitArr.count == 1 {
                digitArr.insert(1, at: 0)
                return digitArr
            } else {
                digitArr[i-1] = digitArr[i-1] + 1
                var index = i - 1
                while index > -1 {
                    if digitArr[index] > 9 {
                        digitArr[index] = 0
                        if index == 0 {
                            digitArr.insert(1, at: 0)
                        }else {
                            digitArr[index-1] = digitArr[index-1] + 1
                        }
                     } else {
                        return digitArr
                    }
                     index-=1
                }
                return digitArr
             }
         }
     }
    // MARK: 回文数 2020.03.08
      /*
    判断一个整数是否是回文数。回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。

       示例 1:
       输入: 121
       输出: true
       
       示例 2:
       输入: -121
       输出: false
       解释: 从左向右读, 为 -121 。 从右向左读, 为 121- 。因此它不是一个回文数。
       
       示例 3:
       输入: 10
       输出: false
       解释: 从右向左读, 为 01 。因此它不是一个回文数。
       */
    func isPalindrome(_ x: Int) -> Bool {
        let str = String(format: "%ld",x)
        let str1 = String(str.reversed())
        return str == str1
    }
    // MARK: 两数之和 2020.03.07
/*
    给定一个整数数组nums 和一个目标值target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。

        示例:
        给定 nums = [2, 7, 11, 15], target = 9
        因为 nums[0] + nums[1] = 2 + 7 = 9
        所以返回 [0, 1]
    */
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        // 1. 暴力解法 两次遍历
//        for i in 0..<nums.count {
//            let num1 = nums[i]
//            for j in (i+1)..<nums.count {
//                let num2 = nums[j]
//                if num1 + num2 == target {
//                    return [i, j]
//                }
//            }
//        }
//        return []
        
        // 2. 哈希表
        var map = [Int:Int]()
        for i in 0..<nums.count {
            let value = target - nums[i]
            if !map.keys.contains(value) {
                map.updateValue(i, forKey: nums[i])
            } else {
                let index = map[value]!
                return [i, index].reversed()
            }
            
        }
        
        return []
        
    }
    
}

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init (_ val: Int) {
        self.val = val
        self.next = nil
    }
}

// MARK: LeetCode 641. 设计循环双端队列 2020.03.21
/*
    设计实现双端队列。
    你的实现需要支持以下操作：
    MyCircularDeque(k)：构造函数,双端队列的大小为k。
    insertFront()：将一个元素添加到双端队列头部。 如果操作成功返回 true。
    insertLast()：将一个元素添加到双端队列尾部。如果操作成功返回 true。
    deleteFront()：从双端队列头部删除一个元素。 如果操作成功返回 true。
    deleteLast()：从双端队列尾部删除一个元素。如果操作成功返回 true。
    getFront()：从双端队列头部获得一个元素。如果双端队列为空，返回 -1。
    getRear()：获得双端队列的最后一个元素。 如果双端队列为空，返回 -1。
    isEmpty()：检查双端队列是否为空。
    isFull()：检查双端队列是否满了。
     
    示例：
    MyCircularDeque circularDeque = new MycircularDeque(3); // 设置容量大小为3
    circularDeque.insertLast(1);             // 返回 true
    circularDeque.insertLast(2);             // 返回 true
    circularDeque.insertFront(3);            // 返回 true
    circularDeque.insertFront(4);            // 已经满了，返回 false
    circularDeque.getRear();                 // 返回 2
    circularDeque.isFull();                  // 返回 true
    circularDeque.deleteLast();              // 返回 true
    circularDeque.insertFront(4);            // 返回 true
    circularDeque.getFront();                // 返回 4

    提示：
    所有值的范围为 [1, 1000]
    操作次数的范围为 [1, 1000]
    请不要使用内置的双端队列库。
*/
class MyCircularDeque {

    var capacity : Int
    var contain : [Int]
    var invalid_capacity : Int
    

    /** Initialize your data structure here. Set the size of the deque to be k. */
    init(_ k: Int) {
        self.capacity = k
        self.invalid_capacity = k
        self.contain = Array()
    }
    
    /** Adds an item at the front of Deque. Return true if the operation is successful. */
    func insertFront(_ value: Int) -> Bool {
        if isFull() { return false }
        contain.insert(value, at: 0)
        invalid_capacity-=1
        return true
    }
    
    /** Adds an item at the rear of Deque. Return true if the operation is successful. */
    func insertLast(_ value: Int) -> Bool {
        if isFull() { return false }
        contain.append(value)
        invalid_capacity-=1
        return true
    }
    
    /** Deletes an item from the front of Deque. Return true if the operation is successful. */
    func deleteFront() -> Bool {
        if isEmpty() { return false }
        contain.removeFirst()
        invalid_capacity+=1
        return true
    }
    
    /** Deletes an item from the rear of Deque. Return true if the operation is successful. */
    func deleteLast() -> Bool {
        if isEmpty() { return false }
        contain.removeLast()
        invalid_capacity+=1
        return true
    }
    
    /** Get the front item from the deque. */
    func getFront() -> Int {
        if isEmpty() { return -1 }
        return contain.first!
    }
    
    /** Get the last item from the deque. */
    func getRear() -> Int {
        if isEmpty() { return -1 }
        return contain.last!
    }
    
    /** Checks whether the circular deque is empty or not. */
    func isEmpty() -> Bool {
        return invalid_capacity == capacity
    }
    
    /** Checks whether the circular deque is full or not. */
    func isFull() -> Bool {
        return contain.count == capacity
    }
}

/**
 * Your MyCircularDeque object will be instantiated and called as such:
 * let obj = MyCircularDeque(k)
 * let ret_1: Bool = obj.insertFront(value)
 * let ret_2: Bool = obj.insertLast(value)
 * let ret_3: Bool = obj.deleteFront()
 * let ret_4: Bool = obj.deleteLast()
 * let ret_5: Int = obj.getFront()
 * let ret_6: Int = obj.getRear()
 * let ret_7: Bool = obj.isEmpty()
 * let ret_8: Bool = obj.isFull()
 */
