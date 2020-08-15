//
//  MultipleOptionsCell.swift
//  MedicalHistory
//
//  Created by Eliany Barrera on 14/8/20.
//  Copyright © 2020 Eliany Barrera. All rights reserved.
//

import UIKit

class MultipleOptionsCell: UICollectionViewCell {
    
    static var reuseIdentifier = "MultipleOptions"
    
    
    var options: [String]? {
        didSet {
            
        }
    }
    
    private let title = UILabel()
    private let value = UITextField()
    
    private let pickerView = UIPickerView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(title)
        self.addSubview(value)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        title.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            title.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            value.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            value.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
