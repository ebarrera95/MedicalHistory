//
//  PhysicalExamination.swift
//  MedicalHistory
//
//  Created by Eliany Barrera on 5/8/20.
//  Copyright © 2020 Eliany Barrera. All rights reserved.
//

import Foundation

struct PhysicalExamination {
    let vitalSigns: VitalSigns
    let bodyMeasurements: BodyMeasures
    let organSystemsEvaluation: OrganSystemsEvaluation
    let visitResults: VisitResults
}

struct VitalSigns {
    let bloodPressure: BloodPressure
    let temperature: Float
    let heartRate: Int
    let respiratoryRate: Int
    let oxygenSaturation: Float
    
    struct BloodPressure {
        let systolic: Int
        let diastolic: Int
    }
}

struct BodyMeasures {
    let weight: Float
    let height: Float
    
    var bodyMassIndex: Float {
        return weight/powf(height, 2)
    }
}

struct OrganSystemsEvaluation {
    let generalAspect: String
    let skin: String
    let lymphatic: String
    let respiratorySystem: String
    let cardiovascularSystem: String
    let abdomen: String
    let genitourinary: String
    let osteomioarticular: String
    let neurologicalSystem: String
    let other: String
}

struct VisitResults {
    let test: String
    let diagnosis: String
    let treatment: String
}
