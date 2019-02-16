//
//  ViewController.swift
//  如何让UIView淡出
//
//  Created by hs on 2019/1/23.
//  Copyright © 2019 hs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let maskedView = UIView(frame: .init(x: 50, y: 50, width: 256, height: 256))
        maskedView.backgroundColor = .blue
        
        let gradientMaskLayer = CAGradientLayer()
        gradientMaskLayer.frame = maskedView.bounds
        
        gradientMaskLayer.colors = [UIColor.clear.cgColor, UIColor.white.cgColor, UIColor.white.cgColor, UIColor.clear.cgColor]
        gradientMaskLayer.locations = [0, 0.1, 0.9, 1]
        
        maskedView.layer.mask = gradientMaskLayer
        view.addSubview(maskedView)
        
        
    }


}

