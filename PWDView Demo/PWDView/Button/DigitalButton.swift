//
//  DigitalButton.swift
//  PWDView Demo
//
//  Created by 李懿哲 on 8/29/18.
//  Copyright © 2018 pf. All rights reserved.
//

import UIKit

class DigitalButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.borderWidth = 0.5
        layer.borderColor = hexStringToUIColor(hex: "E6E6E6").cgColor
        
        backgroundColor = UIColor.white
        
        addTarget(self, action: #selector(touchDown(_:)), for: .touchDown)
        addTarget(self, action: #selector(touchUp(_:)), for: [.touchCancel, .touchDragExit, .touchUpInside, .touchUpOutside])
        
        setTitleColor(UIColor.lightGray, for: .disabled)
    }
    
    @objc
    func touchDown(_ sender: UIButton) {
        backgroundColor = UIColor.black.withAlphaComponent(0.0964)
    }
    
    @objc
    func touchUp(_ sender: UIButton) {
        backgroundColor = UIColor.white
    }
}
