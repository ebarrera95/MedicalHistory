//
//  HomeDataSource.swift
//  MedicalHistory
//
//  Created by Eliany Barrera on 3/8/20.
//  Copyright © 2020 Eliany Barrera. All rights reserved.
//

import UIKit

class HomeDataSource: NSObject, UICollectionViewDataSource {
    
    var patients: [Patient]
    
    weak var collectionView: UICollectionView? {
        didSet {
            collectionView?.backgroundColor = .white
            collectionView?.register(PatientCell.self, forCellWithReuseIdentifier: PatientCell.reuseIdentifier)
            collectionView?.register(PatientsHeader.self, forSupplementaryViewOfKind: "Header", withReuseIdentifier: PatientsHeader.reuseIdentifier)
            
            collectionView?.dataSource = self
            collectionView?.delegate = self
        }
    }
    
    init(patients: [Patient]) {
        self.patients = patients
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return patients.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PatientCell.reuseIdentifier, for: indexPath)
        guard let patientCell = cell as? PatientCell else { fatalError() }
        patientCell.patientName = patients[indexPath.row].name
        return patientCell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            return collectionView.dequeueReusableSupplementaryView(ofKind: "Header", withReuseIdentifier: PatientsHeader.reuseIdentifier, for: indexPath)
        default:
            assert(false, "unexpected element")
        }
        
        
    }
}

extension HomeDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 44)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 55)
    }
}
