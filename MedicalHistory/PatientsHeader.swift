//
//  PatientsHeader.swift
//  MedicalHistory
//
//  Created by Eliany Barrera on 3/8/20.
//  Copyright © 2020 Eliany Barrera. All rights reserved.
//

import UIKit

class PatientsHeader: UICollectionReusableView {
    static var reuseIdentifier = "PatientsHeader"
    
    private let headerName = "Patients"
    
    private let headerMainLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "Patients List", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 24)])
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(headerMainLabel)
        headerMainLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerMainLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            headerMainLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
