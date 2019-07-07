//
//  ViewController.swift
//  CoordinatorTest
//
//  Created by hs on 2019/3/14.
//  Copyright © 2019 hs. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Storyboarded{

    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
    }


    @IBAction func buyTapped(_ sender: UIButton) {
        coordinator?.buySubscription()
    }
    
    @IBAction func createAccount(_ sender: UIButton) {
        coordinator?.createAccount()
    }
    
}

