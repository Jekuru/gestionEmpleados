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
    /**
     FUNCIONALIDAD API:                     REGISTRO
     */
    func callingRegisterAPI(register: RegisterModel, token_value: String, completionHandler: @escaping (Bool, String) -> ()){
        let headers: HTTPHeaders = [
            .contentType("application/json"),
            .init(name: "Token", value: token_value)
        ]
        
        AF.request(register_url, method: .put, parameters: register, encoder: JSONParameterEncoder.default, headers: headers).response{ response in
            switch response.result{
            case .success(let data):
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    if response.response?.statusCode == 200 {
                        completionHandler(true, (json as AnyObject).value(forKey: "msg") as! String)
                    }else {
                        completionHandler(false, (json as AnyObject).value(forKey: "msg") as! String)
                    }
                }catch{
                    print(error.localizedDescription)
                    completionHandler(false, "Sorry but there was an unexpected error, please contact with an application administrator.")
                }
            case .failure(let error):
                print(error.localizedDescription)
                completionHandler(false, "Sorry but there was an unexpected error, please contact with an application administrator.")
            }
        }
    }
    
    /**
     FUNCIONALIDAD API:                     LOGIN
     */
    func callingLoginAPI(login: LoginModel, completionHandler: @escaping (Bool, String, UsersModel?) -> ()){
        let headers: HTTPHeaders = [
            .contentType("application/json")
        ]
        
        AF.request(login_url, method: .put, parameters: login, encoder: JSONParameterEncoder.default, headers: headers).response{ response in
            switch response.result{
            case .success(let data):
                guard let data = data else
                {
                    completionHandler(false, "", nil)
                    return
                }
                let loginResponse = try? JSONDecoder().decode(LoginResponseModel.self, from: data)
                if loginResponse == nil {
                    completionHandler(false, "", nil)
                }
                else {
                    if response.response?.statusCode ?? 404 == 200 {
                    completionHandler(true, loginResponse!.msg, loginResponse?.user)
                    }
                    else {
                        completionHandler(false, loginResponse!.msg, nil)
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
                completionHandler(false, "Sorry but there was an unexpected error, please contact with an application administrator.", nil)
            }
        }
    }
    
    /**
     FUNCIONALIDAD API:                     RESTABLECER CONTRASEÑA
     */
    func callingResetAPI(reset: ResetPasswordModel, completionHandler: @escaping (Bool, String) -> ()){
        let headers: HTTPHeaders = [
            .contentType("application/json")
        ]
        
        AF.request(reset_url, method: .put, parameters: reset, encoder: JSONParameterEncoder.default, headers: headers).response{ response in
            switch response.result{
            case .success(let data):
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    if response.response?.statusCode == 200 {
                        completionHandler(true, (json as AnyObject).value(forKey: "msg") as! String)
                    }else {
                        completionHandler(false, (json as AnyObject).value(forKey: "msg") as! String)
                    }
                }catch{
                    print(error.localizedDescription)
                    completionHandler(false, "Sorry but there was an unexpected error, please contact with an application administrator.")
                }
            case .failure(let error):
                print(error.localizedDescription)
                completionHandler(false, "Sorry but there was an unexpected error, please contact with an application administrator.")
            }
        }
    }
    
    /**
     FUNCIONALIDAD API:                     CERRAR SESIÓN
     */
    func callingLogoutAPI(logout: LogoutModel, token_value: String, completionHandler: @escaping (Bool, String) -> ()){
        let headers: HTTPHeaders = [
            .contentType("application/json"),
            .init(name: "token", value: token_value)
        ]
        
        AF.request(logut_url, method: .put, parameters: logout, encoder: JSONParameterEncoder.default, headers: headers).response{ response in
            switch response.result{
            case .success(let data):
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    if response.response?.statusCode == 200 {
                        completionHandler(true, (json as AnyObject).value(forKey: "msg") as! String)
                    }else {
                        completionHandler(false, (json as AnyObject).value(forKey: "msg") as! String)
                    }
                }catch{
                    print(error.localizedDescription)
                    completionHandler(false, "Sorry but there was an unexpected error, please contact with an application administrator.")
                }
            case .failure(let error):
                print(error.localizedDescription)
                completionHandler(false, "Sorry but there was an unexpected error, please contact with an application administrator.")
            }
        }
    }
    /**
     
     FUNCIONALIDAD API:                     OBTENER LISTADO USUARIOS
     */
    func callingGetAllUsersAPI(token: String, completionHandler: @escaping Handler){
        let headers: HTTPHeaders = [
            .contentType("application/json"),
            .init(name: "token", value: token)
        ]
        
        AF.request(users_url, method: .get, headers: headers).response{ response in
            switch response.result {
            case .success(let data):
                if let data = data, let userResponse = try? JSONDecoder().decode(UsersResponse.self, from: data) {
                    completionHandler(.success(userResponse.data))
                }
                else {
                    completionHandler(.failure(.custom(message: "Por favor, compruebe los datos introducidos.")))
                }
            case .failure(let error):
                print(error.localizedDescription)
                completionHandler(.failure(.custom(message: "Por favor, compruebe los datos introducidos.")))
            }
        }
    }
}
