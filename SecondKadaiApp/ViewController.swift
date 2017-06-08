//
//  ViewController.swift
//  SecondKadaiApp
//
//  Created by Rei Yamaguchi on 2017/06/09..
//  Copyright © 2017年 rei.yamaguchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var inputNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.inputNameTextField.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let greetingViewController: GreetingViewController = segue.destination as! GreetingViewController
        greetingViewController.name = inputNameTextField.text!
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.inputNameTextField.isFirstResponder{
            self.inputNameTextField.resignFirstResponder()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        inputNameTextField.resignFirstResponder()
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {}
}

