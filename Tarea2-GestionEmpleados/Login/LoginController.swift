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
                Session.current.name = user?.name
                Session.current.job = user?.job
                Session.current.email = user?.email
                Session.current.salary = user?.salary
                Session.current.biography = user?.biography
                Session.current.profileImgUrl = user?.profileImgUrl
                self.loadMainView()
            } else {
                self.showAlert(title: "Can not log in", message: str)
            }
        }
    }
    
    func loadMainView(){
        performSegue(withIdentifier: "MenuView", sender: nil) // Cambiar vista a MenuView

    }
}
