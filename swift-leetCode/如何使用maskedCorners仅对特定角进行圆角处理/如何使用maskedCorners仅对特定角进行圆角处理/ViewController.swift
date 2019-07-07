//
//  ViewController.swift
//  如何使用maskedCorners仅对特定角进行圆角处理
//
//  Created by hs on 2019/1/23.
//  Copyright © 2019 hs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let redBox = UIView(frame: .init(x: 100, y: 100, width: 128, height: 128))
        redBox.backgroundColor = .red
        redBox.layer.cornerRadius = 25.0
        redBox.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        view.addSubview(redBox)
    }


}

