//
//  HomeViewController.swift
//  MedicalHistory
//
//  Created by Eliany Barrera on 3/8/20.
//  Copyright © 2020 Eliany Barrera. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    weak var coordinator: HomeCoordinator?
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        customiseNavigationBar()
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        collectionView.frame = view.bounds
    }
    
    func customiseNavigationBar() {
        navigationItem.title = "Patients"
    }
}
