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
        APIManager.shareInstance.callingLoginAPI(login: modelLogin) { (result) in
            switch result{
            case .success(let json):
                
                //Test
                print(json as AnyObject)
                
                let name = ((json as AnyObject).value(forKey: "user") as AnyObject).value(forKey: "name") as! String
                let api_token = ((json as AnyObject).value(forKey: "user") as AnyObject).value(forKey: "api_token") as! String
                let modelLoginResponse = LoginResponseModel(name: name, api_token: api_token)
                UserDefaults.standard.set(name, forKey: "username")
                UserDefaults.standard.set(api_token, forKey: "token")
                
                self.loadMainView()
                
                /*
                 Store
                     UserDefaults.standard.set(object/value, forKey: "key_name")
                 Retrive
                     var returnValue: [datatype]? = UserDefaults.standard.object(forKey: "key_name") as? [datatype]
                 Remove
                     UserDefaults.standard.removeObject(forKey:"key_name")
                 */
                
                
                // Test
                print(modelLoginResponse)
                
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func loadMainView(){
        performSegue(withIdentifier: "MenuView", sender: nil) // Cambiar vista a MainView
    }
}
