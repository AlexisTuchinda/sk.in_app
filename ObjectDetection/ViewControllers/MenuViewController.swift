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
    override func viewDidLoad() {
      super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
    }
    
    @IBAction func uploadButtonPressed(_ sender: UIButton) {
        if let url = URL(string: "https://docs.google.com/forms/d/e/1FAIpQLSfjLOjj1Wx5rZxGbPWMhM-MZklr8z8r5Fce5up7fBd-V8hsrQ/viewform"){
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true
            
            let vc = SFSafariViewController(url: url, configuration: config)
            present(vc, animated: true)
        }        
    }
    
}
