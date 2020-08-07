//
//  MedicalHistory.swift
//  MedicalHistory
//
//  Created by Eliany Barrera on 7/8/20.
//  Copyright © 2020 Eliany Barrera. All rights reserved.
//

import Foundation

struct MedicalHistory {
    
    let patient: Patient
    let date: Date
    var disciple: Disciple
    
    let chiefComplains: String
    let historyOfPresentIllness: String
    
    let pastMedicalHistory: PastMedicalHistory
    
    let physicalExamination: PhysicalExamination
    
    let test: String
    let diagnosis: String
    let treatment: String
    
    let reevaluations: [PatientReevaluation]
}
