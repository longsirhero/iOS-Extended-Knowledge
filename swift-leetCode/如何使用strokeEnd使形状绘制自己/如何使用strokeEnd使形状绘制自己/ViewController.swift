//
//  ViewController.swift
//  如何使用strokeEnd使形状绘制自己
//
//  Created by hs on 2019/1/23.
//  Copyright © 2019 hs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layer = CAShapeLayer()
        let bounds = CGRect(x: 50.0, y: 50.0, width: 250.0, height: 250.0)
        layer.path = UIBezierPath(roundedRect: bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 20, height: 20)).cgPath
        layer.strokeColor = UIColor.black.cgColor
        layer.fillColor = nil
        layer.lineDashPattern = [8, 6]
        
        let vm = UIView(frame: .init(x: 100, y: 100, width: bounds.width, height: bounds.height))
        vm.layer.addSublayer(layer)
        view.addSubview(vm)
        
        // 创建并添加一个CABasicAnimation来调整strokeEnd属性:
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 2
        animation.autoreverses = true
        animation.repeatCount = .infinity
        layer.add(animation, forKey: "line")
        
        // 在两秒钟内将动画从0（未绘制）变为1（完全绘制），但也使其在结束时反转并重复无限次。
    }


}

