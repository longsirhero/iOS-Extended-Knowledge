//
//  ViewController.swift
//  18、UIApplicationMain
//
//  Created by hs on 2019/6/12.
//  Copyright © 2019 hs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let btn = UIButton(frame: .init(x: 100, y: 100, width: 100, height: 44))
        btn.backgroundColor = UIColor.red
        btn.addTarget(self, action: #selector(action), for: .touchUpInside)
        view.addSubview(btn)
    }

    
    @objc fileprivate func action() {
        print("buton click ................")
    }
   
}

