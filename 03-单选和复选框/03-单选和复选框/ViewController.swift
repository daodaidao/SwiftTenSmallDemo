//
//  ViewController.swift
//  03-单选和复选框
//
//  Created by caihongguang on 2018/5/31.
//  Copyright © 2018年 SYJ. All rights reserved.
//

import UIKit

class ViewController:
      UIViewController{
 
    var radioButtonController: SYJRadioButtonsController?

    
    @IBOutlet weak var button1: SYJRadioButton!
    
    @IBOutlet weak var button2: SYJRadioButton!
    
    @IBOutlet weak var button3: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.view.backgroundColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
        radioButtonController = SYJRadioButtonsController(buttons:button1,button2,button3)
        radioButtonController?.delegate = self
        
        
    }

    


}

extension ViewController:SYJRadioButtonControllerDelegate{
   
    func didSelectButton(selectedButton: UIButton?) {
     
        NSLog(" \(selectedButton)" )
 
    }
    
    
    
    
}

