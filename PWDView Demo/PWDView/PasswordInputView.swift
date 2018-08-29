//
//  PasswordInputView.swift
//  PWDView Demo
//
//  Created by 李懿哲 on 8/29/18.
//  Copyright © 2018 pf. All rights reserved.
//

import UIKit

class PasswordInputView: UIView {
    
    // MARK: Life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cleanup()
    }

    // MARK: Properties
    
    @IBOutlet weak var contentView: UIView!
    
    var pwd = ""
    
    @IBOutlet var labels: [UILabel]!
    @IBOutlet var btns: [DigitalButton]!

    // MARK: Actions
    
    @IBAction func cancel(_ sender: Any) {
        
        pwd = ""
        cleanup()

        removeFromSuperview()
    }
    
    @IBAction func btnClicked(_ sender: DigitalButton) {
        
        let inputNumber = sender.tag % 100
        handleInput(inputNumber)
    }
    
    func cleanup() {
        pwd = ""
        updateDisplay()
        unlockKeyboard()
    }
    
    // MARK: Other methods
    
    /// 处理点击的数字
    func handleInput(_ num: Int){
        if num == 10 {
            /** 如果是删除键 */
            pwd = "\(pwd.dropLast())"
            updateDisplay()
        } else {
            /** 如果是数字键 */
            if pwd.length() < 6 {
                pwd = "\(pwd)\(num)"
                updateDisplay()
                checkLength()
            }
        }
    }
    
    func checkLength() {
        if pwd.length() >= 6 {
            lockKeyboard()
            checkPwd()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                self.hidePwd()
            }
        }
    }
    
    /// 更新UI显示
    func updateDisplay() {
        for (index, lable) in labels.enumerated() {
            let str = pwd.getString(index)
            lable.text = str
        }
    }
    
    func checkPwd() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            self.shakeAnimation()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
            self.cleanup()
        }
    }
    
    func shakeAnimation() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: contentView.center.x - 10, y: contentView.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: contentView.center.x + 10, y: contentView.center.y))
        
        contentView.layer.add(animation, forKey: "position")
    }
    
    /// 锁定键盘
    func lockKeyboard() {
        for btn in btns {
            btn.isEnabled = false
        }
    }
    
    /// 解开键盘
    func unlockKeyboard() {
        for btn in btns {
            btn.isEnabled = true
        }
    }
    
    func hidePwd() {
        pwd = "******"
        updateDisplay()
    }
    
}

extension String {
    
    /// 获取指定下标的string
    func getString(_ index: Int) -> String {
        for (i, digital) in self.enumerated() {
            if i == index {
                return "\(digital)"
            }
        }
        
        return ""
    }
    
    func length() -> Int {
        return self.lengthOfBytes(using: .utf8)
    }
}
