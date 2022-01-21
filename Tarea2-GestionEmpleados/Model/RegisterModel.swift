//
//  RegisterModel.swift
//  Tarea2-GestionEmpleados
//
//  Created by APPS2M on 18/1/22.
//

import Foundation

struct RegisterModel : Encodable {
    let name: String
    let email: String
    let password: String?
    let job: String
    let salary: Float
    let biography: String
    let avatar: String?
}
