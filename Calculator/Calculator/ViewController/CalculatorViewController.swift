//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension CalculatorViewController {
    @IBAction func numberKeyButtonPressed(_ sender: UIButton) {
        print(sender.titleLabel?.text)
    }
}

