//
//  SJYCheckbox.swift
//  03-单选和复选框
//
//  Created by caihongguang on 2018/5/31.
//  Copyright © 2018年 SYJ. All rights reserved.
//

import Foundation
import UIKit

/*
 Checkbox is a simple, animation free checkbox and UISwitch alternative designed
 to be performant and easy to implement.
 */


public class SYJCheckbox: UIControl {
    
    // MARK: - Enums
    
    /*
     Shape of the center checkmark that appears when Checkbox.isChecked == true
     */
    
    public enum CheckmarkStyle {
        //■
        case square
        /// ●
        case circle
        /// ╳
        case cross
        /// ✓
        case tick
        
    }
    
    /*  Shape of the outside box containing the checkmarks contents.  */
    /*
     Used as a visual indication of where the user can tap
     */
    
    public enum BorderStyle {
        /// ▢
        case square
        /// ◯
        case circle
    }
    
    //MARK: -Properties
    /*
     Shape of the center checkmark that appears when 'Checkbox.isChecked == true'
     
     Default : .square
     */
    
    public var checkmarkStyle: CheckmarkStyle = .square
    
    public var borderStyle: BorderStyle = .square
    
    public var borderWidth: CGFloat = 2

    public var checkmarkSize: CGFloat = 0.5
    
    public var uncheckedBorderColor:UIColor!
    public var checkedBorderColor:UIColor!
    
    public var checkmarkColor:UIColor!
    public var checkboxBackgroundColor:UIColor! = .white
    
    //增加触摸半径
    public var increasedTouchRadius: CGFloat = 5
    
    public var valueChanged: ((_ isChecked: Bool ) -> Void)?
    
    
    public var isChecked: Bool = false {
        
        didSet {
            setNeedsDisplay()
        }
        
    }
    
    
    public var useHapticFeedBack: Bool = true
    
    private var feedbackGenerator:UIImpactFeedbackGenerator?
    
    //MARK: - Lifecycle
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupDefaults()
    }
    
    public required  init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupDefaults()
    }
    
    
    private func setupDefaults(){
        
        backgroundColor = UIColor.init(white: 1, alpha: 1)
        /*
         　 tintColor字面意思也是色彩,痕迹,相当于是一个描述一个视图中的线条的颜色,这与痕迹的中文释义不谋而合;
         　　　　(1).tintColor是描述线条轮廓的一种颜色,该颜色默认具有传递性,默认状态下最底部的视图的tintcolor会一直往上面的视图传递
         */
        uncheckedBorderColor = tintColor
        checkedBorderColor = tintColor
        checkmarkColor = tintColor
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(recognizer:)))
        addGestureRecognizer(tapGesture)
        
        if useHapticFeedBack {
            feedbackGenerator = UIImpactFeedbackGenerator(style: .light)
            feedbackGenerator?.prepare()
        }
        
    }
    
    public override func draw(_ rect: CGRect) {
        if isChecked {
            drawBorder(shape: borderStyle, in: rect)
            if isChecked {
                drawCheckmark(style: checkmarkStyle, in: rect)
            }
            
        }
    }
    
    private func circleBorder(rect: CGRect){
        
        let ovalPath = UIBezierPath(ovalIn: rect)
        
        if isChecked{
            checkedBorderColor.setStroke()
        }else {
            uncheckedBorderColor.setStroke()
        }
        ovalPath.lineWidth = borderWidth/2
        ovalPath.stroke()
        checkboxBackgroundColor.setFill()
        ovalPath.fill()
    }
    
    // MARK: - Borders
    
    private func drawBorder(shape: BorderStyle, in rect: CGRect) {
        let adjustedRect = CGRect(x: borderWidth/2,
                                  y: borderWidth/2,
                                  width: rect.width-borderWidth,
                                  height: rect.height-borderWidth)
        
        switch shape {
        case .circle:
            circleBorder(rect: adjustedRect)
        case .square:
            squareBorder(rect: adjustedRect)
        }
    }
    
    private func squareBorder(rect: CGRect) {
        let rectanglePath = UIBezierPath(rect: rect)
        
        if isChecked {
            checkedBorderColor.setStroke()
        } else {
            uncheckedBorderColor.setStroke()
        }
        
        rectanglePath.lineWidth = borderWidth
        rectanglePath.stroke()
        checkboxBackgroundColor.setFill()
        rectanglePath.fill()
    }
    
    //MARK: -Checkmarks
    private func drawCheckmark(style: CheckmarkStyle, in rect: CGRect) {
        
        let adjustedRect = checkmarkRect(in: rect)
        
        switch checkmarkStyle {
        case .square:
            squareCheckmark(rect: adjustedRect)
        case .circle:
            circleCheckmark(rect: adjustedRect)
        case .cross:
            crossCheckmark(rect: adjustedRect)
        case .tick:
            tickCheckMark(rect: adjustedRect)
            
        }
        
        
    }
    
    
    private  func tickCheckMark(rect: CGRect){
        
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: rect.minX + 0.04688 * rect.width, y: rect.minY + 0.63548 * rect.height))
        bezierPath.addLine(to: CGPoint(x: rect.minX + 0.34896 * rect.width, y: rect.minY + 0.95161 * rect.height))
        bezierPath.addLine(to: CGPoint(x: rect.minX + 0.95312 * rect.width, y: rect.minY + 0.04839 * rect.height))
        checkmarkColor.setStroke()
        bezierPath.lineWidth = checkmarkSize * 2
        bezierPath.stroke()
    }
    
    private func crossCheckmark(rect:CGRect){
        
        let bezier4Path = UIBezierPath()
        bezier4Path.move(to: CGPoint(x: rect.minX + 0.06250 * rect.width, y: rect.minY + 0.06452 * rect.height))
        bezier4Path.addLine(to: CGPoint(x: rect.minX + 0.93750 * rect.height, y: rect.minY + 0.93548 * rect.height))
        bezier4Path.move(to: CGPoint(x: rect.minX + 0.93750 * rect.width, y: rect.minY + 0.06452 * rect.height))
        bezier4Path.addLine(to: CGPoint(x: rect.minX + 0.06250 * rect.width, y: rect.minY + 0.93548 * rect.height))
        checkmarkColor.setStroke()
        
        bezier4Path.lineWidth = checkmarkSize * 2
        bezier4Path.stroke()
        
    }
    
    private func squareCheckmark(rect: CGRect){
        let path = UIBezierPath(rect: rect)
        checkmarkColor.setFill()
        path.fill()
    }
    
    private func circleCheckmark(rect: CGRect){
        let ovalPath = UIBezierPath(ovalIn: rect)
        checkmarkColor.setFill()
        ovalPath.fill()
    }
    
    
    // MARK: - Size Calculations
    private func checkmarkRect(in rect: CGRect) -> CGRect {
        //获取控件最大X.Y值
        let width = rect.maxX * checkmarkSize
        let height = rect.maxY * checkmarkSize
        let adjustedRect = CGRect(x: (rect.maxX - width)/2, y: (rect.maxY - height)/2, width: width, height: height)
        
        return adjustedRect
        
    }
    
    
    public override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let relativeFrame = self.bounds
        let hitTestEdgeInsets = UIEdgeInsets(top: -increasedTouchRadius, left: -increasedTouchRadius, bottom: -increasedTouchRadius, right: -increasedTouchRadius)
        
        let hitFrame = UIEdgeInsetsInsetRect(relativeFrame, hitTestEdgeInsets)
        
        return hitFrame.contains(point)
        
    }
    
    
    //MARK：- Touch
    
    @objc private func handleTapGesture(recognizer:UITapGestureRecognizer){
        
        isChecked = !isChecked
        
        valueChanged?(isChecked)
        
        sendActions(for: .valueChanged)
        
        if  useHapticFeedBack {
            //Trigger impact feedback.
            feedbackGenerator?.impactOccurred()
            // keep the generator in a prepared state
            feedbackGenerator?.prepare()
            
        }
        
    }
    
    
}
