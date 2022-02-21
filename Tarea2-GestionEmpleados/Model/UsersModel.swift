//
//  UsersModel.swift
//  Tarea2-GestionEmpleados
//
//  Created by APPS2M on 11/2/22.
//

import Foundation


struct UsersResponse: Codable {
    let status: Int
    let message: String?
    let data: [UsersModel]
}

struct UsersModel: Codable {
    let id: Int
    let name: String
    let email: String
    let job: String
    let salary: Double
    let biography: String?
    let profileImgUrl: String?
    let api_token: String?
}
