//
//  ViewController.swift
//  如何使用CAShapeLayer绘制形状
//
//  Created by hs on 2019/1/23.
//  Copyright © 2019 hs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // CAShapeLayer: 提供各种2D形状的硬件加速绘图，并包括额外的功能，如填充和描边颜色，线帽，图案等。
        let layer = CAShapeLayer()
        layer.path = UIBezierPath(roundedRect: CGRect.init(x: 64.0, y: 64.0, width: 160, height: 160), cornerRadius: 50).cgPath
        layer.fillColor = UIColor.red.cgColor
        
        let vm = UIView(frame: .init(x: 100, y: 100, width: 300, height: 300))
        vm.backgroundColor = UIColor.blue
        view.addSubview(vm)
        vm.layer.addSublayer(layer)
    }


}

