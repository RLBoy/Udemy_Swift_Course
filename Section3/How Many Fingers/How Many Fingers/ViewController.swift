//
//  ViewController.swift
//  How Many Fingers
//
//  Created by Quentin Pousseur on 03/01/2019.
//  Copyright © 2019 Quentin Pousseur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var labelText: UILabel!
    var randomNumber: Int = 0
    
    
    @IBAction func GuessButton(_ sender: Any) {
        randomNumber = Int(arc4random_uniform(6))
        if let number = textField.text{
            if let number2Int = Int(number){
                if number2Int == randomNumber{
                    labelText.text = "You're right!"
                }else{
                    labelText.text = "You're wrong! The number is \(randomNumber)"
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

