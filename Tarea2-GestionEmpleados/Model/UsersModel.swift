//
//  UsersModel.swift
//  Tarea2-GestionEmpleados
//
//  Created by APPS2M on 11/2/22.
//

import Foundation

struct UsersModel: Decodable{
    let id: Int
    let name: String
    let email: String
    let job: String
    let salary: Int
    let biography: String?
    let profileImgUrl: String?
}
