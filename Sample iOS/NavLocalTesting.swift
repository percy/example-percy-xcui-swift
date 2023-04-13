//
//  NavLocalTesting.swift
//  Sample iOS
//
//  Created by Pankaj Yadav on 12/04/23.
//  Copyright © 2023 BrowserStack. All rights reserved.
//

import UIKit
import WebKit

class NavLocalTesting: UIViewController, WKUIDelegate {
    
    @IBOutlet weak var localtestingwebview: WKWebView!
    
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        localtestingwebview = WKWebView(frame: .zero, configuration: webConfiguration)
        localtestingwebview.uiDelegate = self
        view = localtestingwebview
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string:"https://local.bsstag.com:45692")
        let request = URLRequest(url: url!)
        
        localtestingwebview.load(request)
        
    }
    
    override var prefersStatusBarHidden: Bool  {
        return true
    }
    

}
