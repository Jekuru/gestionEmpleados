//
//  Session.swift
//  Tarea2-GestionEmpleados
//
//  Created by APPS2M on 21/2/22.
//

import Foundation

final class Session {
    static let current = Session()
    private init() {}
    
    var token: String?
    
    var name: String?
    var job: String?
    var email: String?
    var salary: Double?
    var biography: String?
    var profileImgUrl: String?
}
