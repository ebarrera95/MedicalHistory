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
        
        .init(name: "Contact Info", fields: [
            .init(name: "Address", value: nil, type: .text),
            .init(name: "Phone number", value: nil, type: .text)
        ]),
        
        .init(name: "Principal Carer", fields: [
        .init(name: "Fist Name", value: nil, type: .text),
        .init(name: "Middle Name", value: nil, type: .text),
        .init(name: "Last Name", value: nil, type: .text),
        
        .init(name: "Relationship", value: nil, type: .text)
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
            collectionView?.register(DatePickerCell.self, forCellWithReuseIdentifier: DatePickerCell.reuseIdentifier)
            collectionView?.register(ReusableHeaderView.self, forSupplementaryViewOfKind: "Header", withReuseIdentifier: ReusableHeaderView.reuseIdentifier)
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
        case .set(let options):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MultipleOptionsCell.reuseIdentifier, for: indexPath)
            guard let multipleOptionCell = cell as? MultipleOptionsCell else { fatalError() }
            multipleOptionCell.title = field.name
            multipleOptionCell.options = options
            return multipleOptionCell
        case .date(let date):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DatePickerCell.reuseIdentifier, for: indexPath)
            guard let datePickerCell = cell as? DatePickerCell else { fatalError() }
            datePickerCell.date = date
            datePickerCell.title = field.name
            return datePickerCell
        case .longText:
            fatalError()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: "Header", withReuseIdentifier: ReusableHeaderView.reuseIdentifier, for: indexPath)
            guard let header = reusableView as? ReusableHeaderView else { fatalError() }
            header.title = NSAttributedString(string: "Principal Carer", attributes: [
                NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20)
            ])
            return header
        default:
            assert(false, "unexpected element")
        }
    }
}

extension NewPatientDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 32, height: 44)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if newPatientForm.sections[section].name == "Principal Carer" {
            return UIEdgeInsets(top: 4, left: 16, bottom: 22, right: 16)
        } else {
            return UIEdgeInsets(top: 22, left: 16, bottom: 22, right: 16)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if newPatientForm.sections[section].name == "Principal Carer" {
           return CGSize(width: collectionView.frame.width, height: 44)
        } else {
            return .zero
        }
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
