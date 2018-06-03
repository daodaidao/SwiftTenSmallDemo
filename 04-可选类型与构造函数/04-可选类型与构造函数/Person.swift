//
//  Person.swift
//  04-可选类型与构造函数
//
//  Created by keep on 2018/6/3.
//  Copyright © 2018年 SYJ. All rights reserved.
//


//2.type! 和type? 的区别

//类型type?和类型type!中符号的意思
//?: 告诉编译器我不确定这个变量是否有值，有值就继续调用，否则返回nil
//!: 告诉编译器这个变量是肯定有值的，否则报错
import Foundation

class Person {
    //此处residence为可选型，初始值为nil
    var residence: Residence?
    //Use of undeclared type 'Residence'
    
    
}

class Residence {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
/*
     下标脚本
     subscript
     可以使用在类，结构体，枚举中
     提供一种类似于数组或者字典通过下标来访问对象的方式
     */
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set(newValue) {
            rooms[i] = newValue
        }
    }
//
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
}


