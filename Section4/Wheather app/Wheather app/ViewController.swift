//
//  ViewController.swift
//  Wheather app
//
//  Created by Quentin Pousseur on 04/01/2019.
//  Copyright © 2019 Quentin Pousseur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    @IBAction func submitButton(_ sender: Any) {
        
        if let url = URL(string: "https://www.weather-forecast.com/locations/" + cityTextField.text!.replacingOccurrences(of: " ", with: "-") + "/forecasts/latest"){
            
        
        let request = NSMutableURLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            data,response,error in
            
            var message = ""
            
            if error != nil{
                print(error!)
            } else {
                if let unwrappedData = data{
                    let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                    var stringSeparator = "Weather Today </h2>(1&ndash;3 days)</span><p class=\"b-forecast__table-description-content\"><span class=\"phrase\">"
                    if let contentArray = dataString?.components(separatedBy: stringSeparator){
                        //print(contentArray)
                        if contentArray.count > 1 {
                            
                            stringSeparator = "</span>"
                            
                            let newContentArray = contentArray[1].components(separatedBy: stringSeparator)
                            
                            if newContentArray.count > 1 {
                                
                                message = newContentArray[0].replacingOccurrences(of: "&deg;", with: "°")
                                print(message)
                            }
                            
                            
                        }
                    }
                }
            }
            if message == "" {
                message = "The weather couldn't be found. Please try again!"
            }
            DispatchQueue.main.sync {
                self.resultLabel.text = message
            }
        }
        
        task.resume()
        } else {
            resultLabel.text = "The weather couldn't be found. Please try again!"
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
    }


}

