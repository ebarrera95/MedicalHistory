//
//  HomeCoordinator.swift
//  MedicalHistory
//
//  Created by Eliany Barrera on 3/8/20.
//  Copyright © 2020 Eliany Barrera. All rights reserved.
//

import UIKit

class HomeCoordinator: Coordinator {
    var childCoordinator: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let homeVC = HomeViewController()
        homeVC.coordinator = self
        navigationController.pushViewController(homeVC, animated: true)
    }
    
    func presentNewPatientForm() {
        let newPatientCoordinator = NewPatientCoordinator(navigationController: self.navigationController)
        childCoordinator.append(newPatientCoordinator)
        newPatientCoordinator.start()
    }
}
