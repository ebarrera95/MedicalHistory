//
//  ShortTextFieldCell.swift
//  MedicalHistory
//
//  Created by Eliany Barrera on 14/8/20.
//  Copyright © 2020 Eliany Barrera. All rights reserved.
//

import UIKit

class ShortTextFieldCell: UICollectionViewCell {
    static var reuseIdentifier = "ShortTextField"
    
    var title: String? {
        didSet {
            guard let title = self.title else { fatalError() }
            textField.attributedPlaceholder = NSAttributedString(string: title, attributes: nil)
        }
    }
    
    private let textField = UITextField()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(textField)
        backgroundColor = UIColor.tertiarySystemGroupedBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        textField.frame = self.bounds
    }
}
