//
//  Coordinator.swift
//  HackingWithSwift
//
//  Created by hs on 2019/3/14.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController {get set}
    var children: [Coordinator] { get set}
    func start()
}
