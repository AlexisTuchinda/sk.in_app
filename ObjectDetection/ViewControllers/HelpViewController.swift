//
//  HelpViewController.swift
//  ObjectDetection
//
//  Created by Fahim Hasan Khan on 8/3/22.
//

import Foundation
import UIKit
import WebKit
import SafariServices

class HelpViewController: UIViewController, WKNavigationDelegate, WKUIDelegate
{
    @IBOutlet var webView: WKWebView!
    
    override func viewDidLoad() {
            super.viewDidLoad()

            webView.uiDelegate = self
            webView.navigationDelegate = self

            let url = Bundle.main.url(forResource: "help", withExtension: "html", subdirectory: "files")!
            webView.loadFileURL(url, allowingReadAccessTo: url)
            webView.allowsBackForwardNavigationGestures = true
            webView.navigationDelegate = self
        }

    override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
    }
       
    @IBAction func helpButtonPressed(_ sender: UIButton) {
        if let url = URL(string: "https://sites.google.com/ucsc.edu/sk-in/help"){
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true
            
            let vc = SFSafariViewController(url: url, configuration: config)
            present(vc, animated: true)
        }
    }
    
}

extension HelpViewController{
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (_: WKNavigationActionPolicy) -> Void) {
        if navigationAction.navigationType == .linkActivated,
          let reqURL = navigationAction.request.url {
          UIApplication.shared.open(reqURL, options: [:], completionHandler: nil)
          decisionHandler(.cancel)

        } else {
          decisionHandler(.allow)
        }
      }
}
