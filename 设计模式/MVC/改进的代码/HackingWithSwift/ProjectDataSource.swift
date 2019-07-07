//
//  ProjectDataSource.swift
//  HackingWithSwift
//
//  Created by hs on 2019/3/13.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import UIKit

class ProjectDataSource: NSObject, UITableViewDataSource {
    
    var projects = [Project]()
    
    override init() {
        projects = Bundle.main.decode(from: "projects.json")
    }

    func project(at index: Int) -> Project {
        return projects[index]
    }
    
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projects.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let project = projects[indexPath.row]
        cell.textLabel?.attributedText = project.attributedTitle
        return cell
    }
}
