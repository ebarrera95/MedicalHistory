//
//  Patient.swift
//  MedicalHistory
//
//  Created by Eliany Barrera on 3/8/20.
//  Copyright © 2020 Eliany Barrera. All rights reserved.
//

import Foundation
struct Patient {
    
    let name: Name
    
    let age: Int
    let address: String
    let telephone: Telephone
    
    let gender: Gender
    let principalCarer: PrincipalCarer
    
    struct PrincipalCarer {
        let carerName: Name
        let relationship: String
    }
    
    struct Name {
        let fistName: String
        let middleName: String
        let lastName: String
    }
    
    enum Gender {
        case female
        case male
    }
    
    struct Telephone {
        let number: String
        let type: TelephoneType
        
        enum TelephoneType {
            case home
            case mobile
        }
    }
}
