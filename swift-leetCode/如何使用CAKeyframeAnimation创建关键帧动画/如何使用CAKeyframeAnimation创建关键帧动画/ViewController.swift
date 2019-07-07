//
//  ViewController.swift
//  如何使用CAKeyframeAnimation创建关键帧动画
//
//  Created by hs on 2019/1/23.
//  Copyright © 2019 hs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let shakeView = UIView(frame: .init(x: 100, y: 100, width: 100, height: 100))
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vm = UIView(frame: .init(x: 0, y: 0, width: 50, height: 50))
        vm.backgroundColor = UIColor.red
        view.addSubview(vm)
        
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.y"
        animation.values = [0, 300, 0]
        animation.keyTimes = [0, 0.5, 1]
        animation.duration = 2
        animation.isAdditive = true
        vm.layer.add(animation, forKey: "move")
        
        shakeView.backgroundColor = UIColor.cyan
        view.addSubview(shakeView)
    }

    // 使用关键帧动画来创建一个简单的抖动效果，可以在简短的动画中左右移动视图。这将再次使用加法动画，因为我们想要指定相对值（向左和向右移动一点）而不是绝对值：
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        shakeView(vm: shakeView)
    }
    
    func shakeView(vm: UIView) {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.values = [0, 10, -10, 10, -5, 5, -5, 0]
        animation.keyTimes = [0, 0.125, 0.25, 0.375, 0.5, 0.625, 0.75, 0.875, 1]
        animation.duration = 0.4
        animation.isAdditive = true
        vm.layer.add(animation, forKey: "shake")
    }
}

