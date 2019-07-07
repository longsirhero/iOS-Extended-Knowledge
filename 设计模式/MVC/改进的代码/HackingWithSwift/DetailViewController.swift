//
//  DetailViewController.swift
//  HackingWithSwift
//
//  Created by Paul Hudson on 08/11/2018.
//  Copyright © 2018 Hacking with Swift. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, Storyboarded {
    var project: Project!
    
    weak var coordinator: MainCoordinator?
    
    override func loadView() {
        super.loadView()
         view = DetailView(project: project, readAction: readProject)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        assert(project != nil, "You must set a project before show this view controller.")

        navigationItem.largeTitleDisplayMode = .never
        title = "Project \(project.number)"

       
    }

    @objc func readProject() {
        coordinator?.read(project)
    }
}
