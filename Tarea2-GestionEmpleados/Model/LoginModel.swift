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
    let user: UsersModel
}

/**
     "status": 1,
     "msg": "Login succesfull",
     "user": {
         "id": 206,
         "name": "Miguel Estevez",
         "email": "miguel.estevez@etico.com",
         "job": "executive",
         "salary": 34555.54,
         "biography": "Autem temporibus et consequatur eligendi. Minus amet praesentium sequi animi.\n\nAperiam quasi aperiam deleniti qui. Illo est excepturi quos veniam. Aliquam quaerat est ut. Est sapiente quo quod quibusdam rerum.",
         "profileImgUrl": "https://pbs.twimg.com/profile_images/1012362101510160384/EjayQ10E_400x400.jpg",
         "api_token": "$2y$10$w22Y.x2lom0Qmyu1t9qJ8ujvNjPunwE8VYxif4aLtWyJ4AvSWW1Qi"
     }
 */
