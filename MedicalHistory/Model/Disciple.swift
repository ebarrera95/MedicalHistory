//
//  DisciplesMakingMovement.swift
//  MedicalHistory
//
//  Created by Eliany Barrera on 7/8/20.
//  Copyright © 2020 Eliany Barrera. All rights reserved.
//

import Foundation

enum Disciple {
    case no
    case yes(DiscipleshipMovement)
}

struct DiscipleshipMovement {
    let date: Date
    let observations: String
}
