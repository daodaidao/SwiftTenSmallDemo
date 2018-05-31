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

    //单选按钮
    @IBOutlet weak var button1: SYJRadioButton!
    
    @IBOutlet weak var button2: SYJRadioButton!
    
    @IBOutlet weak var button3: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
        radioButtonController = SYJRadioButtonsController(buttons:button1,button2,button3)
        radioButtonController?.delegate = self
        
        //多选框
        addCheckboxSubviews()
        
        
    }
    
    func addCheckboxSubviews(){
        
//        let circleBox = SYJCheckbox(frame: CGRect(x: 30, y: 40, width: 125, height: 125))
//        circleBox.boraderWidth = 1
//        circleBox.borderStyle = .circle
//        circleBox.checkmarkStyle = .circle
//        circleBox.uncheckedBorderColor = .lightGray
//        circleBox.checkmarkSize = 0.8
//        circleBox.checkmarkColor = .blue
//        circleBox.backgroundColor = .red
//        circleBox.addTarget(self, action: #selector(circleBoxValueChanged(sender:)), for: .valueChanged)
//        view.addSubview(circleBox)
        
        // tick
        let tickBox = SYJCheckbox(frame: CGRect(x: 30, y: 160, width: 25, height: 25))
        tickBox.borderStyle = .square
        tickBox.checkmarkStyle = .tick
        tickBox.checkmarkSize = 0.7
//        tickBox.backgroundColor = .red
        view.addSubview(tickBox)
        tickBox.addTarget(self, action: #selector(tickBoxBoxValueChanged(sender:)), for: .valueChanged)

        
        
        
    }

    
    @objc func tickBoxBoxValueChanged(sender:SYJCheckbox)
    {
        print("value change: \(sender.isChecked)")
        
    }
}


extension ViewController:SYJRadioButtonControllerDelegate{
   
    func didSelectButton(selectedButton: UIButton?) {
     
        NSLog(" \(selectedButton)" )
 
    }
    
    
    
    
}

