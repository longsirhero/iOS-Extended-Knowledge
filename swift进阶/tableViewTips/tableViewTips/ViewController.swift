//
//  ViewController.swift
//  tableViewTips
//
//  Created by WingChing Yip on 2018/9/1.
//  Copyright © 2018年 WingChing Yip. All rights reserved.
//

// MARK: - 资源：https://ke.qq.com/webcourse/index.html#cid=134145&term_id=100150190&taid=562773859896321&vid=j1410xhgx4d

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let textValue = "这是测试 这是测试 这是测试 这是测试 这是测试 这是测试 这是测试 这是测试 这是测试 这是测试 这是测试 这是测试 这是测试 这是测试 这是测试"
    var dic: Dictionary<String, String> = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.estimatedRowHeight = 60
        tableView.rowHeight = UITableViewAutomaticDimension
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        let label = cell.viewWithTag(100) as! UILabel
        label.text = textValue
        if dic[String(indexPath.row)] == "0" {
            label.numberOfLines = 0
        }else {
            label.numberOfLines = 1
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        let label = cell!.contentView.viewWithTag(100) as! UILabel
        tableView.beginUpdates()
        if label.numberOfLines == 0 {
            label.numberOfLines = 1
            dic[String(indexPath.row)] = "1"
        } else {
            label.numberOfLines = 0
            dic[String(indexPath.row)] = "0"
        }
        tableView.endUpdates()
    }
    
    // MARK: - 分割线顶部对齐
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.layoutMargins = UIEdgeInsets.zero
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
    }
}

