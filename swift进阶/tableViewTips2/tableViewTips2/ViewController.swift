//
//  ViewController.swift
//  tableViewTips2
//
//  Created by WingChing Yip on 2018/9/1.
//  Copyright © 2018年 WingChing Yip. All rights reserved.
//

// MARK: - 资源： https://ke.qq.com/webcourse/index.html#cid=134145&term_id=100150190&taid=562773859896321&vid=j1410xhgx4d

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        
        for cell in tableView.visibleCells {
            let bottomView = cell.contentView.viewWithTag(200)
            let image = bottomView?.viewWithTag(201)
            // 获取相对于屏幕的位置
            let rect = bottomView?.convert((bottomView?.bounds)!, to: nil)
            var Y = UIScreen.main.bounds.size.height - (rect?.origin.y)! - 600
            Y*=0.2
            if Y > 0 {
                Y = 0
            }
            if Y < -100 {
                Y = -100
            }
            
            image?.frame.origin.y = Y
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.layoutMargins = UIEdgeInsets.zero
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
    }
    
    // MARK: -  图片向上下移动画
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        for cell in tableView.visibleCells {
            let bottomView = cell.contentView.viewWithTag(200)
            let image = bottomView?.viewWithTag(201)
            // 获取相对于屏幕的位置
            let rect = bottomView?.convert((bottomView?.bounds)!, to: nil)
            var Y = UIScreen.main.bounds.size.height - (rect?.origin.y)! - 600
            Y*=0.2
            if Y > 0 {
                Y = 0
            }
            if Y < -100 {
                Y = -100
            }
            
            image?.frame.origin.y = Y

        }
    }
}

