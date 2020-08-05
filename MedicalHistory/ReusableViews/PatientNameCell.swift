//
//  PatientNameCell.swift
//  MedicalHistory
//
//  Created by Eliany Barrera on 5/8/20.
//  Copyright © 2020 Eliany Barrera. All rights reserved.
//

import UIKit

class PatientNameCell: UICollectionViewCell {
    
    static var reuseIdentifier = "PatientNameCell"
    
    var nameCellType: PatientNameType? {
        didSet {
            guard let cellType = nameCellType else { fatalError() }
            switch cellType {
            case .fistName:
                nameTextField.textContentType = .givenName
                nameTextField.attributedPlaceholder = NSAttributedString(string: "Fist Name")
            case .middleName:
                nameTextField.textContentType = .middleName
                nameTextField.attributedPlaceholder = NSAttributedString(string: "Middle Name")
            case .lastName:
                nameTextField.textContentType = .familyName
                nameTextField.attributedPlaceholder = NSAttributedString(string: "Last Name")
            }
        }
    }
    
    private let nameTextField = UITextField()
    private let bottomLine: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 0.5
        view.backgroundColor = UIColor.systemGray
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(nameTextField)
        addSubview(bottomLine)
        
        activateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func activateConstraints() {
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameTextField.heightAnchor.constraint(equalTo: heightAnchor, constant: -1),
            nameTextField.widthAnchor.constraint(equalTo: widthAnchor, constant: -32),
            nameTextField.topAnchor.constraint(equalTo: topAnchor),
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            bottomLine.heightAnchor.constraint(equalToConstant: 1),
            bottomLine.widthAnchor.constraint(equalTo: widthAnchor, constant: -32),
            bottomLine.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 1),
            bottomLine.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor)
        ])
    }
}

extension PatientNameCell: UITextFieldDelegate {
    
}

enum PatientNameType: CaseIterable {
    case fistName
    case middleName
    case lastName
}
