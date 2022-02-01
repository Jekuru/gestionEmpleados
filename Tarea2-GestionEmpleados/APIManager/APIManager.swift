//
//  APIManager.swift
//  Tarea2-GestionEmpleados
//
//  Created by APPS2M on 18/1/22.
//

import Foundation
import Alamofire

enum APIErrors: Error{
    case custom(message: String)
}

typealias Handler = (Swift.Result<Any?, APIErrors>) -> Void

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
                        completionHandler(true, (json as AnyObject).value(forKey: "msg") as! String)
                    }else {
                        completionHandler(false, (json as AnyObject).value(forKey: "msg") as! String)
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
    
    func callingLoginAPI(login: LoginModel, completionHandler: @escaping Handler){
        let headers: HTTPHeaders = [
            .contentType("application/json")
        ]
        
        AF.request(login_url, method: .put, parameters: login, encoder: JSONParameterEncoder.default, headers: headers).response{ response in
            debugPrint(response)
            switch response.result{
            case .success(let data):
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    print(json)
                    if response.response?.statusCode == 200 {
                        completionHandler(.success(json))
                    }else {
                        completionHandler(.failure(.custom(message: "Por favor, compruebe los datos introducidos.")))
                    }
                }catch{
                    print(error.localizedDescription)
                    completionHandler(.failure(.custom(message: "Por favor, vuelva a intentarlo.")))
                }
            case .failure(let error):
                print(error.localizedDescription)
                completionHandler(.failure(.custom(message: "Por favor, compruebe los datos introducidos.")))
            }
        }
    }
}
