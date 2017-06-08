//
//  GreetingViewController.swift
//  SecondKadaiApp
//
//  Created by Rei Yamaguchi on 2017/06/09.
//  Copyright © 2017年 rei.yamaguchi. All rights reserved.
//

import UIKit

class GreetingViewController: UIViewController {

    @IBOutlet var greetingLabel: UILabel!
    
    var name: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        greetingLabel.text = "こんにちは、\(name) さん"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
