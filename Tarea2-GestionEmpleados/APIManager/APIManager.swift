//
//  APIManager.swift
//  Tarea2-GestionEmpleados
//
//  Created by APPS2M on 18/1/22.
//

import Foundation
import Alamofire

class APIManager{
    static let shareInstance = APIManager()
    
    func callingRegisterAPI(register: RegisterModel){
        let headers: HTTPHeaders = [
            .contentType("application/json")
        ]
        
        AF.request(register_url, method: .post, parameters: register, encoder: JSONParameterEncoder.default, headers: headers).response{ response in
            debugPrint(response)
        }
    }
}


