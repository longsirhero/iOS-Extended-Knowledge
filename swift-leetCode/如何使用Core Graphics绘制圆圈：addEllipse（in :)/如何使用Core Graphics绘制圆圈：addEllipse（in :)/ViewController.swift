//
//  ViewController.swift
//  如何使用Core Graphics绘制圆圈：addEllipse（in :)
//
//  Created by hs on 2019/1/24.
//  Copyright © 2019 hs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Core Graphics能够用几行代码绘制圆形和椭圆形
        let renderer = UIGraphicsImageRenderer(size: .init(width: 200.0, height: 200.0))
        let img = renderer.image {ctx in
            ctx.cgContext.setFillColor(UIColor.red.cgColor)
            ctx.cgContext.setLineWidth(10)
            ctx.cgContext.setStrokeColor(UIColor.green.cgColor)
            
            let rectangle = CGRect.init(x: 0, y: 0, width: 200.0, height: 200.0)
            ctx.cgContext.addEllipse(in: rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)
        }
        
        let imgView = UIImageView.init(frame: .init(x: 10, y: 90, width: 200.0, height: 200.0))
        imgView.image = img
        view.addSubview(imgView)
    }


}

