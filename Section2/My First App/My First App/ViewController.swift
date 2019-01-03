//
//  ViewController.swift
//  My First App
//
//  Created by Quentin Pousseur on 02/01/2019.
//  Copyright © 2019 Quentin Pousseur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func ClickMe(_ sender: Any) {
        
        if let age = textField.text{
            label.text = "You are " + age + " years old !"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }


}

