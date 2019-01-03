//
//  ViewController.swift
//  Cat Years
//
//  Created by Quentin Pousseur on 03/01/2019.
//  Copyright © 2019 Quentin Pousseur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var labelAge: UILabel!
    
    @IBAction func ageCatButton(_ sender: Any) {
        
        if let age = textField.text{
            if let ageAsNumber = Int(age){
                let ageInCatYears = ageAsNumber*7
                labelAge.text = "Your cat is " + String(ageInCatYears) + " in cat years"
            }
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

