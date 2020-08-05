//
//  NewPatientViewController.swift
//  MedicalHistory
//
//  Created by Eliany Barrera on 4/8/20.
//  Copyright © 2020 Eliany Barrera. All rights reserved.
//

import UIKit

class NewPatientViewController: UIViewController {
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    var newPatientDataSource = NewPatientDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(collectionView)
        
        newPatientDataSource.collectionView = collectionView
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
}
