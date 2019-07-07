//
//  ReadViewController.swift
//  HackingWithSwift
//
//  Created by Paul Hudson on 08/11/2018.
//  Copyright © 2018 Hacking with Swift. All rights reserved.
//

import UIKit
import WebKit

class ReadViewController: UIViewController, Storyboarded {
    var webView = WKWebView()
    var project: Project!
    var navigationDelegate = NavigationDelegate()
    
    override func loadView() {
        webView.navigationDelegate = navigationDelegate
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        assert(project != nil, "You must set a project before show this view controller.")
        title = project.title
        
        webView.load("https://www.hackingwithswift.com/read/\(project.number)/overview")
    }

    
}
