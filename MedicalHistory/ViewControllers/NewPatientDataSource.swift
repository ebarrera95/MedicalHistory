//
//  NewPatientDataSource.swift
//  MedicalHistory
//
//  Created by Eliany Barrera on 5/8/20.
//  Copyright © 2020 Eliany Barrera. All rights reserved.
//

import UIKit

class NewPatientDataSource: NSObject, UICollectionViewDataSource {
    
    let patientName = PatientNameType.allCases
    
    weak var collectionView: UICollectionView? {
        didSet {
            collectionView?.backgroundColor = .white
            collectionView?.register(PatientNameCell.self, forCellWithReuseIdentifier: PatientNameCell.reuseIdentifier)
            
            collectionView?.dataSource = self
            collectionView?.delegate = self
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return patientName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PatientNameCell.reuseIdentifier, for: indexPath)
        guard let patientNameCell = cell as? PatientNameCell else { fatalError() }
        patientNameCell.nameCellType = patientName[indexPath.row]
        return patientNameCell
    }
}

extension NewPatientDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 44)
    }
}
