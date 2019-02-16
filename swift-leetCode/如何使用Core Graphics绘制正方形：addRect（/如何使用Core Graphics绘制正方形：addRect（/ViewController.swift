//
//  ViewController.swift
//  如何使用Core Graphics绘制正方形：addRect（
//
//  Created by hs on 2019/1/24.
//  Copyright © 2019 hs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 使用addRect()Core Graphics功能绘制正方形（或实际上任何尺寸的矩形
        let renderer = UIGraphicsImageRenderer(size: .init(width: 200, height: 200))
        let img = renderer.image { ctx in
            ctx.cgContext.setFillColor(UIColor.red.cgColor)
            ctx.cgContext.setLineWidth(10)
            ctx.cgContext.setStrokeColor(UIColor.green.cgColor)
            
            let rectangle = CGRect.init(x: 0, y: 0, width: 200, height: 200)
            ctx.cgContext.addRect(rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)
        }
        
        let imagView = UIImageView.init(frame: .init(x: 20, y: 100, width: 200, height: 200))
        imagView.image = img
        view.addSubview(imagView)
        
    }


}

