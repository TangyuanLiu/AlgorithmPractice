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
        var nums1 = [4,0,0,0,0,0]
        var nums2 = [1,2,3,5,6]
        merge(&nums1, 1, nums2, 5)
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


