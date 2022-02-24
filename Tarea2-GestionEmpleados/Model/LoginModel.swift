//
//  LoginModel.swift
//  Tarea2-GestionEmpleados
//
//  Created by APPS2M on 28/1/22.
//

import UIKit

struct LoginModel: Codable{
    let email: String
    let password: String
}

struct LoginResponseModel: Codable{
    let status: Int
    let msg: String
    let user: UsersModel?
}
