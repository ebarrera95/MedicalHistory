//
//  HomeFolderCell.swift
//  MedicalHistory
//
//  Created by Eliany Barrera on 10/8/20.
//  Copyright © 2020 Eliany Barrera. All rights reserved.
//

import UIKit

class HomeFolderCell: UICollectionViewCell {
    static var reuseIdentifier = "HomeFolderCell"
    
    var homeFolder: HomeFolder? {
        didSet {
            guard let homeFolder = self.homeFolder else { fatalError() }
            
            iconView.image = homeFolder.image
            counterLabel.attributedText = NSAttributedString(string: "\(homeFolder.counter)", attributes: nil)
            title.attributedText = NSAttributedString(string: homeFolder.name, attributes: nil)
        }
    }
    
    private let iconView = UIImageView()
    private let counterLabel = UILabel()
    private let title = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.tertiarySystemGroupedBackground
        layer.cornerRadius = 10
        
        addSubview(iconView)
        addSubview(counterLabel)
        addSubview(title)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        iconView.translatesAutoresizingMaskIntoConstraints = false
        counterLabel.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            iconView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            iconView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            
            counterLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            counterLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            
            title.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8)
        ])
    }
}

struct HomeFolder {
    let name: String
    let image: UIImage
    let counter: Int
}
