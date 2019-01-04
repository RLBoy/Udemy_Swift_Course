//
//  ViewController.swift
//  Downloading Web Content
//
//  Created by Quentin Pousseur on 04/01/2019.
//  Copyright © 2019 Quentin Pousseur. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //let url = URL(string: "https://www.stackoverflow.com")!
        
        // View of stackOverFlow
        //webView.load(URLRequest(url: url))
        
        // View HTML
        //webView.loadHTMLString("<h1>Hello there!</h1>", baseURL: nil)
        
        if let url = URL(string: "https://www.stackoverflow.com"){
            let request = NSMutableURLRequest(url: url)
             let task = URLSession.shared.dataTask(with: request as URLRequest){
                
                data,response,error in
                
                if error != nil{
                    
                    print(error!)
                    
                } else {
                    
                    if let unwrappedData = data {
                        let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                        print(dataString!)
                        
                    }
                    
                }
                
                
            }
            task.resume()
        }
        
    }


}

