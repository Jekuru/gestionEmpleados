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
    
    func callingRegisterAPI(register: RegisterModel, token_value: String, completionHandler: @escaping (Bool, String) -> ()){
        let headers: HTTPHeaders = [
            .contentType("application/json"),
            .init(name: "Token", value: token_value)
        ]
        
        AF.request(register_url, method: .put, parameters: register, encoder: JSONParameterEncoder.default, headers: headers).response{ response in
            debugPrint(response)
            switch response.result{
            case .success(let data):
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    print(json)
                    if response.response?.statusCode == 200 {
                        completionHandler(true, (json as? AnyObject)?.value(forKey: "msg") as! String)
                    }else {
                        completionHandler(false, (json as? AnyObject)?.value(forKey: "msg") as! String)
                    }
                }catch{
                    print(error.localizedDescription)
                    completionHandler(false, "Algo ha pasado...")
                }
            case .failure(let error):
                print(error.localizedDescription)
                completionHandler(false, "Algo ha pasado...")
            }
        }
    }
}
