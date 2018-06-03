//
//  ViewController.swift
//  04-可选类型与构造函数
//https://blog.csdn.net/a380880304/article/details/50269935
//  Created by caihongguang on 2018/6/1.
//  Copyright © 2018年 SYJ. All rights reserved.
//

//构造函数的作用
//https://www.cnblogs.com/evening015/p/5351740.html
//分配空间 alloc
//设置初始值 init

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
        
        let jay = Person()
        
//        Value of optional type 'Residence?' not unwrapped; did you mean to use '!' or '?'?
//        原因在于，我们在Person中申明的是Residence?类，此处调用时
        let roomCount = jay.residence?.numberOfRooms
        //如果用!号 要对 Person类中申明Residence初始化 由于初始化后，residence的值不再为空，则调用jay!就不会出错
        

//        类型type?和类型type!中符号的意思
//        ?: 告诉编译器我不确定这个变量是否有值，有值就继续调用，否则返回nil
//        !: 告诉编译器这个变量是肯定有值的，否则报错
        
        loadUI()
    }
    
    func loadUI(){
    
//        楼主的的问题是不明白为什么有时候用!，有时候用?
      
        let amiteLbl : UILabel = UIView(frame:CGRect(x:100,y:100,width:50,height:50)) as! UILabel
        

        
//        self.amiteLbl = UILabel(frame:CGRectMake(50, 100, 200, 40))
//        self.amiteLbl!.text = "I love mixbox"
//        self.view?.addSubview(self.amiteLbl)
        
//        我们分析一下
//        1.首先我们定义一个UILable?，然后对其进行初始化
//        2.此时self.amiteLbl!.text的原因是我们对amiteLbl进行了初始化，我们确定其值不为空，所以使用了!
//        3.而self.view?为什么用的是？呢，因为我们不确定view是否为空，如果此时贸然使用!,当view为nil时，程序就会崩溃。
//        4.我们也可以翻译一下self.view?.addSubview(self.amiteLbl)
    }
    
    
 

}

