//
//  ViewController.swift
//  Is It Prime?
//
//  Created by Quentin Pousseur on 03/01/2019.
//  Copyright © 2019 Quentin Pousseur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var numberTextField: UITextField!
    
    
    @IBAction func isItPrime(_ sender: Any) {
        if let userEnteredString = numberTextField.text {
            
            let userEnteredInteger = Int(userEnteredString)
            
            if let number = userEnteredInteger {
                
                var isPrime = true
                
                if number == 1 {
                    
                    isPrime = false
                    
                }
                
                var i = 2
                
                while i < number {
                    
                    if number % i == 0 {
                        
                        isPrime = false
                        
                    }
                    
                    i += 1
                    
                }
                
                if isPrime {
                    
                    resultLabel.text = "\(number) is prime!"
                    
                } else {
                    
                    resultLabel.text = "\(number) is not prime"
                    
                }
                
                
            } else {
                
                resultLabel.text = "Please enter a positive whole number"
                
            }
            
            
        }
    }
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

