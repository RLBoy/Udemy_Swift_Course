//
//  ViewController.swift
//  Menu Bars
//
//  Created by Quentin Pousseur on 03/01/2019.
//  Copyright © 2019 Quentin Pousseur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    
    @IBAction func cameraPressed(_ sender: Any) {
        print("camera pressed")
        timer.invalidate()
    }
    
    @objc func processTimer(){
        print("A second has passed")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        timer = Timer.scheduledTimer(timeInterval: 1
            , target: self, selector: #selector(processTimer), userInfo: nil, repeats: true)
    }


}

