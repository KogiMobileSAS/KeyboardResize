//
//  ViewController.swift
//  KeyboardResize Example
//
//  Created by Juan Alberto Uribe Otero on 4/22/16.
//  Copyright © 2016 Kogi Mobile. All rights reserved.
//

import UIKit
import KeyboardResize

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        kr_resizeViewWhenKeyboardAppears = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeybaord))
        view.addGestureRecognizer(tapGesture)
    }

    func dismissKeybaord() {
        view.endEditing(true)
    }
}

