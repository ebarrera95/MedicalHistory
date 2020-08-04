//
//  UIColour+.swift
//  MedicalHistory
//
//  Created by Eliany Barrera on 4/8/20.
//  Copyright © 2020 Eliany Barrera. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(r: Int, g: Int, b: Int, a: Int = 255) {
        self.init(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: CGFloat(a)/255)
    }
}
