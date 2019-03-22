//
//  Coordinator.swift
//  CoordinatorTest
//
//  Created by hs on 2019/3/14.
//  Copyright © 2019 hs. All rights reserved.
//
import UIKit
protocol Coordinator {
    var navigationController: UINavigationController { get set }
    var childCoordinators: [Coordinator] { get set }
    
    func start()
}
