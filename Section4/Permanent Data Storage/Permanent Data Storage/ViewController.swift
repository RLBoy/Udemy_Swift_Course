//
//  ViewController.swift
//  Permanent Data Storage
//
//  Created by Quentin Pousseur on 04/01/2019.
//  Copyright © 2019 Quentin Pousseur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberField: UITextField!
    
    
    @IBAction func save(_ sender: Any) {
        UserDefaults.standard.set(numberField.text, forKey: "number")
    }
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
            let numberObject = UserDefaults.standard.object(forKey: "number")
        
            if let number = numberObject as? String {
                numberField.text = number
            }
        }
    
    


}

