//
//  NewPatientCoordinator.swift
//  MedicalHistory
//
//  Created by Eliany Barrera on 4/8/20.
//  Copyright © 2020 Eliany Barrera. All rights reserved.
//

import UIKit

class NewPatientCoordinator: Coordinator {
    
    var childCoordinator: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let newPatientVC = NewPatientViewController()
        navigationController.present(newPatientVC, animated: true, completion: nil)
    }
}
