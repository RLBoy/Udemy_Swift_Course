//
//  ViewController.swift
//  Egg Timer
//
//  Created by Quentin Pousseur on 03/01/2019.
//  Copyright © 2019 Quentin Pousseur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    var time = 0
    
    @IBOutlet weak var labelTimer: UILabel!
    
    @objc func addOne(){
        time += 1
        labelTimer.text = String(time)
    }
    
    
    @IBAction func resetAction(_ sender: Any) {
        time = 0
        labelTimer.text = String(time)
    }
    
   
    @IBAction func addTen(_ sender: Any) {
        time += 10
        labelTimer.text = String(time)
    }
    
    
    @IBAction func minusTen(_ sender: Any) {
        if time >= 10 {
            time -= 10
            labelTimer.text = String(time)
        }
    }
    
    @IBAction func pauseButton(_ sender: Any) {
        timer.invalidate()
    }
    
    @IBAction func playButton(_ sender: Any) {
        if !timer.isValid{
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(addOne), userInfo: nil, repeats: true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }


}

