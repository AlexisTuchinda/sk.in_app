//
//  MenuViewController.swift
//  ObjectDetection
//
//  Created by Fahim Hasan Khan on 8/29/21.
//  Copyright © 2021 Y Media Labs. All rights reserved.
//

import Foundation
import UIKit
import SafariServices

class MenuViewController: UIViewController
{
    var urltext = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let path = Bundle.main.path(forResource: "data", ofType: "txt", inDirectory: "files"){
            do {
                let data = try String(contentsOfFile: path, encoding: .utf8)
                let myStrings = data.components(separatedBy: .newlines)
                urltext = myStrings[1]
            } catch {
                print(error)
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
    }
    
    
    @IBAction func uploadButtonPressed(_ sender: UIButton) {
        if let url = URL(string: urltext){
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true
            
            let vc = SFSafariViewController(url: url, configuration: config)
            present(vc, animated: true)
        }        
    }
    
}
