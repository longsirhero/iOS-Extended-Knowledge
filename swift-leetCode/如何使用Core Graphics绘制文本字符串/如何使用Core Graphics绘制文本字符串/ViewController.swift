//
//  ViewController.swift
//  如何使用Core Graphics绘制文本字符串
//
//  Created by hs on 2019/1/24.
//  Copyright © 2019 hs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 在Core Graphics中绘制文本是微不足道的，因为每个Swift字符串都有一个内置draw(with:)方法，它接受一系列属性以及位置和大小
        let renderer = UIGraphicsImageRenderer(size: .init(width: 400, height: 400))
        let img = renderer.image { ctx in
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            
            let attrs = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Thin", size: 36), NSAttributedString.Key.paragraphStyle: paragraphStyle]
            let string = "How much wood would a woodchuck\nchuck if a woodchuck would chuck wood?"
            string.draw(with: CGRect(x: 32, y: 32, width: 400, height: 400), options: .usesLineFragmentOrigin, attributes: attrs as [NSAttributedString.Key : Any], context: nil)
            
        }
        
        let imageview = UIImageView(frame: .init(x: 0, y: 0, width: 400, height: 400))
        imageview.image = img
        view.addSubview(imageview)
        
    }


}

