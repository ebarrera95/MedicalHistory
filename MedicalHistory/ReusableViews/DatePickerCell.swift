//
//  DatePickerCell.swift
//  MedicalHistory
//
//  Created by Eliany Barrera on 15/8/20.
//  Copyright © 2020 Eliany Barrera. All rights reserved.
//

import UIKit

class DatePickerCell: UICollectionViewCell {
    
    static var reuseIdentifier = "DatePickerCell"
    
    var date: Date? {
        didSet {
            guard let date = self.date else { fatalError() }
            let stringDate = retrieveString(date: date)
            valueTextField.attributedText = NSAttributedString(string: stringDate)
            valueTextField.inputView = pickerView
        }
    }
    
    private let titleLabel = UILabel()
    private let valueTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .right
        textField.tintColor = .clear
        return textField
    }()
    
    private let pickerView: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        return datePicker
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(titleLabel)
        self.addSubview(valueTextField)
        backgroundColor = .tertiarySystemGroupedBackground
        setConstraints()
        pickerView.addTarget(self, action: #selector(userDidChangeDateValue(sender:for:)), for: .valueChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func userDidChangeDateValue(sender: UIDatePicker, for event: UIEvent) {
        let stringDate = retrieveString(date: sender.date)
        valueTextField.attributedText = NSAttributedString(string: stringDate)
    }
    
    private func retrieveString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        return formatter.string(from: date)
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
