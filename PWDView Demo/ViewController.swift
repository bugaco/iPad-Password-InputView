//
//  ViewController.swift
//  PWDView Demo
//
//  Created by 李懿哲 on 8/29/18.
//  Copyright © 2018 pf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    lazy var pwdInputView = Bundle.main.loadNibNamed("PasswordInputView", owner: nil, options: nil)?.first as! PasswordInputView

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showPWDInputView(_ sender: Any) {
        view.addSubview(pwdInputView)
        pwdInputView.frame = view.bounds
    }
    
}

