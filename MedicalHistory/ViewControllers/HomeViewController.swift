//
//  HomeViewController.swift
//  MedicalHistory
//
//  Created by Eliany Barrera on 3/8/20.
//  Copyright © 2020 Eliany Barrera. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    //TODO: See why this variable cannot be weak
    var coordinator: HomeCoordinator?
    
    let patientListCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    var homeDataSource: PatientCollectionViewDataSource?
    
    private let addPatientButton: UIButton = {
        let button = UIButton()
        let configuration = UIImage.SymbolConfiguration(pointSize: 20, weight: .semibold, scale: .large)
        let addSymbol = UIImage(systemName: "plus", withConfiguration: configuration)
        button.setImage(addSymbol, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        customiseNavigationBar()
        view.addSubview(patientListCollectionView)
        view.addSubview(addPatientButton)
        
        addPatientButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addPatientButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            addPatientButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -44)
        ])
        addPatientButton.addTarget(self, action: #selector(newPatientForm), for: .touchUpInside)
        
        
        homeDataSource = PatientCollectionViewDataSource(patients: [])
        
        homeDataSource?.collectionView = patientListCollectionView
    }
    
    override func viewDidLayoutSubviews() {
        patientListCollectionView.frame = view.bounds
    }
    
    @objc private func newPatientForm() {
        coordinator?.presentNewPatientForm()
    }
    
    private func customiseNavigationBar() {
        navigationItem.title = "Medical Histories"
    }
}
