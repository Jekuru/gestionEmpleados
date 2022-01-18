//
//  LoginData.swift
//  Tarea2-GestionEmpleados
//
//  Created by APPS2M on 18/1/22.
//

import Foundation

class LoginData : Decodable {
    var msg: String
    var status: Int
    var user: String?
    
    enum CodingKeys: String, CodingKey {
            case msg
            case status
            case user
        }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.msg = try container.decode(String.self, forKey: .msg)
        self.status = try container.decode(Int.self, forKey: .status)
        self.user = try container.decode(String.self, forKey: .user)
    }
}
