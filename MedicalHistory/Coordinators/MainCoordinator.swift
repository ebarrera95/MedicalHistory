//
//  MainCoordinator.swift
//  MedicalHistory
//
//  Created by Eliany Barrera on 3/8/20.
//  Copyright © 2020 Eliany Barrera. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinator: [Coordinator] = []
    var navigationController: UINavigationController
    
    let window: UIWindow
    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
        
    }
    
    func start() {
        window.rootViewController = self.navigationController
        window.makeKeyAndVisible()
        let homeCoordinator = HomeCoordinator(navigationController: self.navigationController)
        childCoordinator.append(homeCoordinator)
        homeCoordinator.start()
    }
}
