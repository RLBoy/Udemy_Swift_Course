//
//  SecondViewController.swift
//  TODO
//
//  Created by Quentin Pousseur on 04/01/2019.
//  Copyright © 2019 Quentin Pousseur. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var itemTextField: UITextField!
    
    @IBAction func add(_ sender: Any) {
        
        let itemsObject = UserDefaults.standard.object(forKey: "item")
        
        var items: [String]
        
        if let tempItems = itemsObject as? [String] {
            items = tempItems
            items.append(itemTextField.text!)
        }else {
            
            items = [itemTextField.text!]
        }
        UserDefaults.standard.set(items, forKey: "item")
        itemTextField.text = ""
        
    }
    
    //Touch out the case
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //Enter case
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
