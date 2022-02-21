//
//  RegistryController.swift
//  Tarea2-GestionEmpleados
//
//  Created by APPS2M on 11/1/22.
//

import UIKit
import Alamofire

class LoginController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passField: UITextField!

    @IBAction func loginButton(_ sender: UIButton) {
        guard let email = self.emailField.text else {return}
        guard let pass = self.passField.text else {return}
        let modelLogin = LoginModel(email: email, password: pass)
        APIManager.shareInstance.callingLoginAPI(login: modelLogin) { (result, str, user) in
            if result{
                Session.current.token = user?.api_token
                self.loadMainView()
            } else {
                self.showAlert(title: "Login failed", message: str)
            }
            /*
            switch result{
            case .success(let json):
                let userInfo = (json as AnyObject).value(forKey: "user") as AnyObject
                UserDefaults.standard.set(userInfo, forKey: "userinfo")
                self.loadMainView()
            case .failure(let err):
                self.showAlert(title: "Sorry, reset failed", message: str)
                print(err.localizedDescription)
            }*/
        }
    }
    
    func loadMainView(){
        performSegue(withIdentifier: "MenuView", sender: nil) // Cambiar vista a MenuView

    }
}
