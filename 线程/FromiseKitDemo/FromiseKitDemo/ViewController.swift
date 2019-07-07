//
//  ViewController.swift
//  FromiseKitDemo
//
//  Created by hs on 2019/6/10.
//  Copyright © 2019 hs. All rights reserved.
//

import UIKit
import PromiseKit
import SystemConfiguration

/// （KVO的扩展） : http://www.hangge.com/blog/cache/detail_2236.html
class ViewController: UIViewController {
    
    @objc dynamic var message = "hangge.com"
    
    @objc dynamic var tableView: UITableView!
    
    var blockView: UIView!
    
    // 导航栏背景视图
    var barImageView: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.changeMesaage), userInfo: nibName, repeats: true)
        // 监听基本类型的属性
        observeMessage()
        
        // 监听视图尺寸的变化
        observeFrame()
        
        // 渐变导航栏效果
        self.navigationController?.navigationBar.barTintColor = UIColor.orange
        self.barImageView = self.navigationController?.navigationBar.subviews.first
        
        self.tableView = UITableView.init(frame: UIScreen.main.bounds, style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: CELL_ID)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        observeTableViewContentOffset()
        
        // 动画的扩展
        blockView = UIView(frame: .init(x: 0, y: 120, width: 40, height: 40))
        blockView.backgroundColor = UIColor.darkGray
        blockView.alpha = 0
        self.view.addSubview(blockView)
        
        UIView.animate(.promise, duration: 1, delay: 0.4, options: [.curveEaseOut]) {
                self.blockView.frame.origin.x = self.view.bounds.width - self.blockView.frame.width
            self.blockView.alpha = 1
            }.done { (success) in
                print("animation success")
        }
        
        
    }
    
    @objc func changeMesaage() {
        self.message.append("!")
    }

    fileprivate func observeMessage() {
        self.observe(.promise, keyPath: #keyPath(ViewController.message))
            .done { (value) in
                print(value ?? "")
                self.observeMessage()
        }
    }
    
    fileprivate func observeFrame() {
        self.observe(.promise, keyPath: #keyPath(view.frame))
            .done { (value) in
                print("---- 视图尺寸发生变化 -----")
                print(value ?? "")
                self.observeFrame()
        }
    }
    
    fileprivate func observeTableViewContentOffset() {
        self.observe(.promise, keyPath: #keyPath(tableView.contentOffset))
            .done { oldOffset in
                var delta = self.tableView.contentOffset.y / CGFloat(64) + 1
                delta = CGFloat.maximum(delta, 0)
                self.barImageView?.alpha = CGFloat.minimum(delta, 1)
                
                self.observeTableViewContentOffset()
        }
    }
}

