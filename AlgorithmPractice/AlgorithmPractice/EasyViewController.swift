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

        
    }
    
     // MARK: 两数之和 2020.03.07
    /*
     给定一个整数数组nums 和一个目标值target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。

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
    
}


