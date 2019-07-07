//
//  ViewControllerConfig.swift
//  FromiseKitDemo
//
//  Created by hs on 2019/6/10.
//  Copyright © 2019 hs. All rights reserved.
//

import UIKit


let CELL_ID = "cell"


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = "这个是条目\(indexPath.row)"
        return cell
    }
}
