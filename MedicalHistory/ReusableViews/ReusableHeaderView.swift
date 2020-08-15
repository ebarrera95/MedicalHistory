//
//  PatientsHeader.swift
//  MedicalHistory
//
//  Created by Eliany Barrera on 3/8/20.
//  Copyright © 2020 Eliany Barrera. All rights reserved.
//

import UIKit

class ReusableHeaderView: UICollectionReusableView {
    static var reuseIdentifier = "Header"
    
    var title: NSAttributedString? {
        didSet {
            guard let title = self.title else { fatalError() }
            headerMainLabel.attributedText = title
        }
    }
    
    private let headerMainLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(headerMainLabel)
        headerMainLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerMainLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            headerMainLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
