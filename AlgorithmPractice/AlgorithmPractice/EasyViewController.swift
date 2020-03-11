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

        print(plusOne([9,9,9]))
        
//        print(plusOne([7,2,8,5,0,9,1,2,9,5,3,6,6,7,3,2,8,4,3,7,9,5,7,7,4,7,4,9,4,7,0,1,1,1,7,4,0,0,6]))
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
    // MARK: 加一 （如果直接把string转int，会有溢出，超过32位之后就无法成功转化）
     /*
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
}


