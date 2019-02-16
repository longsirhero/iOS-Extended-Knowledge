//
//  ViewController.swift
//  如何在Core Graphics中绘制线条：move（to :)和addLine（to :)
//
//  Created by hs on 2019/1/24.
//  Copyright © 2019 hs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 第一个函数将Core Graphics路径移动到CGPoint您选择的路径，第二个函数将路径移动到新点，同时还添加一条线。
        let renderer1 = UIGraphicsImageRenderer(size: .init(width: 500, height: 500))
        let imag1 = renderer1.image {ctx in
            ctx.cgContext.setStrokeColor(UIColor.white.cgColor)
            ctx.cgContext.setFillColor(UIColor.red.cgColor)
            ctx.cgContext.setLineWidth(3)
            
            ctx.cgContext.move(to: CGPoint.init(x: 50, y: 450))
            ctx.cgContext.addLine(to: CGPoint.init(x: 250, y: 50))
            ctx.cgContext.addLine(to: CGPoint.init(x: 450, y: 450))
            ctx.cgContext.addLine(to: CGPoint.init(x: 50, y: 450))
            
            let rectangle = CGRect.init(x: 0, y: 0, width: 500, height: 500)
            ctx.cgContext.addRect(rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)
        }
        
        let imageview1 = UIImageView.init(frame: .init(x: 0, y: 100, width: 500, height: 500))
        imageview1.image = imag1
        view.addSubview(imageview1)
        
        
       // 一旦掌握了绘制基本线条，就可以通过在绘制时旋转上下文来创建整洁的效果
        let renderer2 = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        let img2 = renderer2.image { ctx in
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            
            ctx.cgContext.translateBy(x: 256, y: 256)
            
            var first = true
            var length: CGFloat = 256
            
            for _ in 0 ..< 256 {
                ctx.cgContext.rotate(by: CGFloat.pi / 2)
                
                if first {
                    ctx.cgContext.move(to: CGPoint(x: length, y: 50))
                    first = false
                } else {
                    ctx.cgContext.addLine(to: CGPoint(x: length, y: 50))
                }
                
                length *= 0.99
            }
            
            ctx.cgContext.strokePath()
        }

//        imageview1.image = img2
    }


}

