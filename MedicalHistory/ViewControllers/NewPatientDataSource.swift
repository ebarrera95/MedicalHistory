//
//  NewPatientDataSource.swift
//  MedicalHistory
//
//  Created by Eliany Barrera on 5/8/20.
//  Copyright © 2020 Eliany Barrera. All rights reserved.
//

import UIKit

class NewPatientDataSource: NSObject, UICollectionViewDataSource {
    
    private let newPatientForm = Form(sections: [
        .init(name: "Patient Name", fields: [
            .init(name: "Fist Name", value: nil, type: .text),
            .init(name: "Middle Name", value: nil, type: .text),
            .init(name: "Last Name", value: nil, type: .text),
        ]),
        
        .init(name: "Personal Info", fields: [
            .init(name: "Age", value: nil, type: .text),
            .init(name: "Gender", value: nil, type: .set(["Male", "Female"]))
        ]),
        
        .init(name: "Address", fields: [
            .init(name: "Address", value: nil, type: .text)
        ]),
        
        .init(name: "Date", fields: [
            .init(name: "Date", value: nil, type: .date(Date()))
        ])
    ])
    
    weak var collectionView: UICollectionView? {
        didSet {
            collectionView?.backgroundColor = .white
            collectionView?.register(ShortTextFieldCell.self, forCellWithReuseIdentifier: ShortTextFieldCell.reuseIdentifier)
            collectionView?.register(MultipleOptionsCell.self, forCellWithReuseIdentifier: MultipleOptionsCell.reuseIdentifier)
            collectionView?.dataSource = self
            collectionView?.delegate = self
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return newPatientForm.sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newPatientForm.sections[section].fields.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let field = newPatientForm.sections[indexPath.section].fields[indexPath.row]
        switch field.type {
        case .text:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShortTextFieldCell.reuseIdentifier, for: indexPath)
            guard let shortTextFieldCell = cell as? ShortTextFieldCell else { fatalError() }
            shortTextFieldCell.title = field.name
            return shortTextFieldCell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShortTextFieldCell.reuseIdentifier, for: indexPath)
            guard let shortTextFieldCell = cell as? ShortTextFieldCell else { fatalError() }
            shortTextFieldCell.title = field.name
            return shortTextFieldCell
        }
    }
}

extension NewPatientDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 32, height: 44)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 44, left: 16, bottom: 0, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2.0
    }

}

struct FormField {
    let name: String
    let value: String?
    let type: ValueType
    
    enum ValueType {
        case text
        case longText
        case set([String])
        case date(Date)
    }
}

struct Form {
    let sections: [Section]
    
    struct Section {
        let name: String
        let fields: [FormField]
    }
}
