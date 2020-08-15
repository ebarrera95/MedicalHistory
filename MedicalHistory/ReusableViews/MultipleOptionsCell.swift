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
            pickerView.delegate = self
            pickerView.dataSource = self
            valueTextField.inputView = pickerView
        }
    }
    var title: String? {
        didSet {
            guard let title = self.title else { fatalError() }
            titleLabel.attributedText = NSAttributedString(string: title)
        }
    }
    
    private let titleLabel = UILabel()
    private let valueTextField: UITextField = {
        let textField = UITextField()
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.gray
        ]
        textField.attributedPlaceholder = NSAttributedString(string: "Not Set", attributes: attributes)
        textField.textAlignment = .right
        textField.tintColor = .clear
        return textField
    }()
    
    private let pickerView = UIPickerView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(titleLabel)
        self.addSubview(valueTextField)
        backgroundColor = .tertiarySystemGroupedBackground
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        valueTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            valueTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            valueTextField.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}

extension MultipleOptionsCell: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        guard let options = self.options else { fatalError() }
        return options.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return contentView.bounds.height
    }
}

extension MultipleOptionsCell: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        guard let options = self.options else { fatalError() }
        let titleInPickerComponent = options[row]
        let attributedTitle = NSAttributedString(string: titleInPickerComponent)
        return attributedTitle
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        valueTextField.attributedText = NSAttributedString(string: options![row])
    }
}
