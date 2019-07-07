//
//  ViewController.swift
//  如何使用CAGradientLayer绘制颜色渐变
//
//  Created by hs on 2019/1/23.
//  Copyright © 2019 hs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let vm = UIView.init(frame: .init(x: 100, y: 100, width: 300, height: 300))
        vm.backgroundColor = UIColor.red
        view.addSubview(vm)
        
        let layer = CAGradientLayer()
        layer.frame = CGRect.init(x: 64, y: 64, width: 160, height: 160)
        layer.colors = [UIColor.red.cgColor, UIColor.black.cgColor]
        vm.layer.addSublayer(layer)
        
        
        // 请注意，您需要填充colors将用于绘制渐变的数组。如果您愿意，可以提供多个，此时您还需要填写locations数组以告知CAGradientLayer每种颜色的开始和停止位置。请注意，您需要指定颜色CGColor与否UIColor。
        
        // 如果要使渐变在不同的方向上工作，则应设置startPoint和endPoint属性。这些都是CGPointsX和Y值介于0和1之间的位置，其中0是一条边，1是相对边。默认起点为X 0.5，Y 0.0，默认终点为X 0.5，Y 1.0，这意味着两个点都位于图层的中心，但它从顶部开始，到底部结束。
        
        
    }


}

