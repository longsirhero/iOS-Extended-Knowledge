//
//  WebView+LoadString.swift
//  HackingWithSwift
//
//  Created by hs on 2019/3/14.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import WebKit

extension WKWebView {
    func load(_ urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        
        let request = URLRequest(url: url)
        load(request)
    }
}


