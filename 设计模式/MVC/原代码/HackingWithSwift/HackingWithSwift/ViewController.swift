//
//  ViewController.swift
//  HackingWithSwift
//
//  Created by Paul Hudson on 08/11/2018.
//  Copyright © 2018 Hacking with Swift. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var projects = [Project]()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Hacking with Swift"
        navigationController?.navigationBar.prefersLargeTitles = true

        guard let url = Bundle.main.url(forResource: "projects", withExtension: "json") else {
            fatalError("Failed to locate projects.json in app bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load projects.json in app bundle.")
        }

        let decoder = JSONDecoder()

        guard let loadedProjects = try? decoder.decode([Project].self, from: data) else {
            fatalError("Failed to decode projects.json from app bundle.")
        }

        projects = loadedProjects
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projects.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let project = projects[indexPath.row]
        cell.textLabel?.attributedText = makeAttributedString(title: project.title, subtitle: project.subtitle)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let project = projects[indexPath.row]

        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
            return
        }

        detailVC.project = project
        navigationController?.pushViewController(detailVC, animated: true)
    }

    func makeAttributedString(title: String, subtitle: String) -> NSAttributedString {
        let titleAttributes = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .headline), NSAttributedString.Key.foregroundColor: UIColor.purple]
        let subtitleAttributes = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .subheadline)]

        let titleString = NSMutableAttributedString(string: "\(title)\n", attributes: titleAttributes)
        let subtitleString = NSAttributedString(string: subtitle, attributes: subtitleAttributes)

        titleString.append(subtitleString)

        return titleString
    }
}

