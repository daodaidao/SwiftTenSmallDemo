//
//  SYJRadioButton.swift
//  03-单选和复选框
//
//  Created by caihongguang on 2018/5/31.
//  Copyright © 2018年 SYJ. All rights reserved.
//

import UIKit

class SYJRadioButton: UIButton {
    
    fileprivate var circleLayer = CAShapeLayer()
    
    fileprivate var fillCircleLayer = CAShapeLayer()
    
    override var isSelected: Bool {
        
        didSet{
            
            toggleButton()
            
        }
        
    }
    
    /*
     Color of the radio button circle . Default value is UIColor red.
     */
    
    @IBInspectable var circleColor: UIColor = UIColor.red {
        //        在Swift语言中用了willSet和didSet这两个特性来监视属性的除初始化之外的属性值变化
        didSet {
            
            circleLayer.strokeColor = strokeColor.cgColor
            self.toggleButton()
        }
        
    }
    
    /*
     Color of the radio button stroke circle. Default value is UIColor red
     */
    
    @IBInspectable var strokeColor: UIColor = UIColor.gray {
        
        didSet{
            circleLayer.strokeColor = strokeColor.cgColor
            self.toggleButton()
        }
        
    }
    
    
    @IBInspectable var circleRadius: CGFloat = 5.0
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    fileprivate func circleFrame() ->CGRect {
        
        var circleFrame = CGRect(x: 0, y: 0, width: 2*circleRadius, height: 2*circleRadius)
        circleFrame.origin.x = 0 + circleLayer.lineWidth
        circleFrame.origin.y = bounds.height/2 - circleFrame.height/2
        
        return circleFrame
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    fileprivate func initialize(){
        
        circleLayer.frame = bounds
        circleLayer.lineWidth = 2
        circleLayer.fillColor = UIColor.clear.cgColor
        layer.addSublayer(circleLayer)
        fillCircleLayer.frame = bounds
        fillCircleLayer.lineWidth = 2
        fillCircleLayer.fillColor = UIColor.clear.cgColor
        fillCircleLayer.strokeColor = UIColor.clear.cgColor
        layer.addSublayer(fillCircleLayer)
        
        self.titleEdgeInsets = UIEdgeInsetsMake(0, 4*circleRadius + 4*circleRadius + 4 * circleLayer.lineWidth, 0, 0    )
        
        self.toggleButton()
    }
    
    
    func toggleButton(){
        if self.isSelected {
            fillCircleLayer.fillColor = circleColor.cgColor
            circleLayer.strokeColor = circleColor.cgColor
        }else {
            fillCircleLayer.fillColor = UIColor.clear.cgColor
            circleLayer.strokeColor = strokeColor.cgColor
        }
        
    }
    
    fileprivate func circlePath() -> UIBezierPath {
        
        return UIBezierPath(ovalIn: circleFrame())
        
    }
    
    fileprivate func fillCirclePath() -> UIBezierPath {
        return UIBezierPath(ovalIn: circleFrame().insetBy(dx: 2, dy: 2))
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        circleLayer.frame = bounds
        circleLayer.path = circlePath().cgPath
        fillCircleLayer.path = fillCirclePath().cgPath
        self.titleEdgeInsets = UIEdgeInsetsMake(0, 2*circleRadius + 4*circleLayer.lineWidth,0,0)
        
    }
    
    override func prepareForInterfaceBuilder() {
        
        initialize()
        
    }
    
    
    
}
