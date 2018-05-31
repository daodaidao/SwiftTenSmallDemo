//
//  SYJRadioButtonsController.swift
//  03-单选和复选框
//
//  Created by caihongguang on 2018/5/31.
//  Copyright © 2018年 SYJ. All rights reserved.
//

import UIKit

@objc protocol SYJRadioButtonControllerDelegate {
    
    /*
     This function is called when a button is selected. If 'shouldLetDeselect' is true, and  a  button  is deselected, this function
     is called with a nil.
     
     */
    
    @objc func didSelectButton(selectedButton:UIButton?)
    
}


class SYJRadioButtonsController: NSObject {
    
    fileprivate var buttonsArray = [UIButton]()
    
    weak var delegate : SYJRadioButtonControllerDelegate? = nil
    
    /* Set whether a selected radio button can be deselected or not. Default value is false.  */
    var shouldLetDeSelect = false
    
    init(buttons: UIButton...){
        super.init()
        for aButton in buttons {
            aButton.addTarget(self, action: #selector(SYJRadioButtonsController.pressed(_:)), for: .touchUpInside)
            
            
        }
        
        self.buttonsArray = buttons
        
    }
    
    @objc func pressed(_ sender: UIButton){
        
        var currentSeletedButton:UIButton? = nil
        if (sender.isSelected){
            
            if shouldLetDeSelect{
                sender.isSelected = false
                currentSeletedButton = nil
            }
            
        }else {
            for aButton in buttonsArray {
                
                aButton.isSelected = false
                
            }
            sender.isSelected = true
            currentSeletedButton = sender
        }
        
        delegate?.didSelectButton(selectedButton: currentSeletedButton)
        
    }
    
    func selectedButton() -> UIButton? {
        
        guard let index = buttonsArray.index(where: {
            button in button.isSelected
        }) else { return nil  }
        
        return buttonsArray[index]
    }
    
    func addButton(_ aButton: UIButton){
        
        buttonsArray.append(aButton)
        
        aButton.addTarget(self, action: #selector(SYJRadioButtonsController.pressed(_:)), for: .touchUpInside)
        
    }
    
    func removeButton(_ aButton: UIButton) {
        var iteratingButton: UIButton? = nil
        if(buttonsArray.contains(aButton))
        {
            iteratingButton = aButton
        }
        if(iteratingButton != nil) {
            buttonsArray.remove(at: buttonsArray.index(of: iteratingButton!)!)
            iteratingButton!.removeTarget(self, action: #selector(SYJRadioButtonsController.pressed(_:)), for: UIControlEvents.touchUpInside)
            iteratingButton!.isSelected = false
        }
    }
    
    func setButtonsArray(_ aButtonsArray: [UIButton]) {
        for aButton in aButtonsArray {
            aButton.addTarget(self, action: #selector(SYJRadioButtonsController.pressed(_:)), for: UIControlEvents.touchUpInside)
        }
        buttonsArray = aButtonsArray
    }
    
}

//多说几句：
//imageView.image.layer.cornerRadius = 5;
//imageView.image.layer.masksToBounds = YES;
//这样设置会触发离屏渲染，比较消耗性能。比如当一个页面上有十几头像这样设置了圆角
//会明显感觉到卡顿。
//这种就是最常用的，也是最耗性能的
//第三种 :通过Core Graphics重新绘制带圆角的视图
//这种方式性能最好
//https://www.cnblogs.com/junhuawang/p/5652220.html






