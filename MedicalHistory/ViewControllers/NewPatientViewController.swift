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
    private var newPatientDataSource = NewPatientDataSource()
    
    private let mainTitle: UILabel = {
        let label = UILabel()
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 32, weight: .bold)
        ]
        label.attributedText = NSAttributedString(string: "New Patient", attributes: attributes)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(collectionView)
        view.addSubview(mainTitle)
        setConstraints()
        collectionView.backgroundColor = .red
        newPatientDataSource.collectionView = collectionView
    }
    
    private func setConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        mainTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            mainTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 32),
            
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: mainTitle.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: view.bounds.height - mainTitle.bounds.height),
            collectionView.widthAnchor.constraint(equalToConstant: view.bounds.width)
        ])
    }
}
