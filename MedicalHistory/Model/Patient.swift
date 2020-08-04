//
//  Patient.swift
//  MedicalHistory
//
//  Created by Eliany Barrera on 3/8/20.
//  Copyright © 2020 Eliany Barrera. All rights reserved.
//

import Foundation
struct Patient {
    
    let name: PatientName
    
    let age: Int
    let address: String
    let telephone: String
    
    let principalCarerAndRelationship: String
    
    struct PatientName {
        let fistName: String
        let middleName: String
        let lastName: String
    }
}
