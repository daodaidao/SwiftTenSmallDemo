//
//  ViewController.swift
//  Swift-$0$1的实际含义
//
//  Created by caihongguang on 2018/5/29.
//  Copyright © 2018年 SYJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
//        swift自动为闭包提供参数名缩写功能，可以直接通过$0和$1等来表示闭包中的第一个第二个参数，并且对应的参数类型会根据函数类型来进行判断。如下代码：
        
    //不使用 $0 $1这些来代替
        let numbers = [1,2,5,4,3,6,8,7]
        //排序
        let sortNumber = numbers.sorted(by: { (a, b) -> Bool in
            return a < b
        })
       
        print("number -" + "\(sortNumber)")
        
    //使用 $0 , $1
        let sortNumbers = numbers.sorted(by: {$0 < $1})
        
        print("$0 < $1number -" + "\(sortNumbers)")

    }
 


}

