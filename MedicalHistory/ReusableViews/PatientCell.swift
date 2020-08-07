//
//  PatientCell.swift
//  MedicalHistory
//
//  Created by Eliany Barrera on 3/8/20.
//  Copyright © 2020 Eliany Barrera. All rights reserved.
//

import UIKit

class PatientCell: UICollectionViewCell {
    
    static var reuseIdentifier = "PatientCell"
    
    var patientName: Patient.Name? {
        didSet {
            guard let name = patientName else { fatalError() }
            let stringName = name.fistName + " " + name.middleName + " " + name.lastName
            nameLabel.attributedText = NSAttributedString(string: stringName)
        }
    }
    
    let nameLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(nameLabel)
        backgroundColor = .white
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
