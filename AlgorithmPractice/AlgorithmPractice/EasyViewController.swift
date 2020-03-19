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
        
        print(majorityElement([2,2,1,1,1,1,2,2]))
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
        for i in 0..<nums.count {
            let num1 = nums[i]
            for j in (i+1)..<nums.count {
                let num2 = nums[j]
                if num1 + num2 == target {
                    return [i, j]
                }
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
