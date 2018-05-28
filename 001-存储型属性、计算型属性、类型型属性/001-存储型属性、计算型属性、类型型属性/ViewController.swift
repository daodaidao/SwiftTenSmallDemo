//
//  ViewController.swift
//  001-存储型属性、计算型属性、类型型属性
//
//  Created by caihongguang on 2018/5/28.
//  Copyright © 2018年 SYJ. All rights reserved.
//

import UIKit

/*
    存储型属性：用于存储一个常量和变量
    计算型属性：不直接存储值，而是通过 get , set 方法来取值或赋值。同时还可以对其他的属性进行操作。
    类型属性：定义在类上的属性。用static 类修饰属性，需要用类名来调用该属性。
 
 */

class ViewController: UIViewController {

   
 
}

struct Point {
    var x: Double = 0.0
    var y: Double = 0.0
}

struct Size {
    var width: Double = 0.0
    var height: Double = 0.0
}

class Rectangle {
    //存储型属性
    var origin: Point = Point()
    var size:Size = Size()
    
    //计算型属性: (1)必须用 var (2)属性的类型不可以省略 (3) 如果要想修改属性的值，必须写setter方法，否则只有一个getter方法
    var center: Point {
        
        get {
            let centerX = origin.x + size.width / 2
            let centerY = origin.x + size.height / 2
            return Point(x: centerX, y: centerY)
        }
        
        //如果不写newCenter,可以直接用newValue
        set(newCenter){
            origin.x = newCenter.x - size.width/2
            origin.y = newCenter.y - size.height/2
        }

    }
    //如果只是这样写，代表的是只有get方法，是不可以给area赋值的
    var area:Double {
        return size.width * size.height
    }
    
    //类型型属性
    static var biggestWidth: Double = 0
    
    init(origin: Point,size: Size) {
        self.origin = origin
        self.size = size
    }
    
    
}

var rectangle = Rectangle(origin: Point(), size: Size(width: 20, height: 40))
//rectangle.center = Point(x: 40, y: 80)






//这个 set, get 方法会导致死循环
//var name: String {
//
//    get {
//        return self.name //这里会调用 get 方法
//    }
//    set {
//        self.name = newValue // 这样调用set方法
//    }
//
//}








