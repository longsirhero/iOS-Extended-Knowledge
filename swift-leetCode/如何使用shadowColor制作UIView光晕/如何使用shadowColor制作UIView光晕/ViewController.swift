//
//  ViewController.swift
//  如何使用shadowColor制作UIView光晕
//
//  Created by hs on 2019/1/23.
//  Copyright © 2019 hs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 由于CALayer背后的所有视图都可以有阴影，但您可以使用相同的属性来创建发光效果。例如，这会创建一个128x128视图，然后给它一个20点的黄色光晕：
        
        let vm = UIView(frame: CGRect(x: 100, y: 100, width: 128, height: 128))
        vm.backgroundColor = UIColor.white
        view.addSubview(vm)
        
        vm.layer.shadowOffset = .zero
        vm.layer.shadowColor = UIColor.yellow.cgColor
        vm.layer.shadowRadius = 20
        vm.layer.shadowOpacity = 1
        vm.layer.shadowPath = UIBezierPath(rect: vm.bounds).cgPath
        
        // 明亮的光线在黑暗的背景下效果最佳，因此请尝试将主视图设为黑色：
        view.backgroundColor = .black
        
    }


}

