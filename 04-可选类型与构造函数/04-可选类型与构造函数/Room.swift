//
//  Room.swift
//  04-可选类型与构造函数
//
//  Created by keep on 2018/6/3.
//  Copyright © 2018年 SYJ. All rights reserved.
//

import UIKit

class Room: NSObject {

    
    /* 稍微深入
     1.初始化和可选型的关系
     */
    
    let name: String
     
    //init中可以初始化name的值(在对象类里用init，vc里不能用)
    init(name: String){self.name = name}
    
    
  
}


//我们尝试一下一些错误的定义：
//        1. 如果在类中申明实例变量，则必须有构造函数或者在申明变量时对其进行初始化，而可选型的变量是可以不初始化的，因为系统会将其初始化为nil
//        2. 如果在类中申明常量，则不管是否是可选型，都必须初始化，因为常量是没有办法修改其值的，所以必须初始化
class Room1
{
   
    let name: String
    init(name:String) {
        self.name = name
    }
    
}

//class Room2
//{
////    Class 'Room2' has no initializers
//    var name: String
//
//    
//}

class Room3
{
    var name: String?

}
//
//class Room4
//{
//    //    Class 'Room4' has no initializers
//    let name: String?
//
//}





