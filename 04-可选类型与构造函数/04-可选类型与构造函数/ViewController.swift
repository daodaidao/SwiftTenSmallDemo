//
//  ViewController.swift
//  04-可选类型与构造函数
//https://blog.csdn.net/a380880304/article/details/50269935
//  Created by caihongguang on 2018/6/1.
//  Copyright © 2018年 SYJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* 基础定义
         
         <1>  可选类型是swift中特有的，c 和oc中没有这个概念。
         当你定义一个类型为可选类型是，它可以为nil，或者可以一个值
         */
        //申明一个可选类型字符串，未初始化默认为nil
        var optionStr: String?
        
        //申明一个可选int常量，无初始值
        let num: Int?
        
        //我们做个实验，令num = 1 ， 再 num =2 ，结果如下图:
        
        let oneStr: String
        oneStr = "123"
        
        
        num = 1
        //第一次 num = 1 是对num进行初始化，所以不会报错。第二次赋值:Immutable value 'num' may only be initialized once. 常量num 只能初始化一次。
//        num = 2

        /*总结:如果申明的是var 可选型变量，则初始化的值为nil
            如果申明的是let 可选行常量，则第一次赋值操作作为初始化,并不会初始化为nil
         */
        
        
        /* <2>强制类型转换时的 option
         强制类型转换时，如Int()操作，不是所有的stirng 都可以转换为int,所以再这时候就体现的
         可选性的作用，要么返回int,要么返回 nil
         */
        
        //converedNumber和converedNum被推测为类型"Int?"
        let possibleNumber = "123"
        let convertedNumber = Int(possibleNumber)
        
        let possibleNum = "hello"
        let convertedNum = Int(possibleNum)
        
        /* 稍微深入
         1.初始化和可选型的关系
         */
        
        
        
        
    }
 

}

