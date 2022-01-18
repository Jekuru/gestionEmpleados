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
        
        
        // Si el login es correcto...
        //performSegue(withIdentifier: "MenuView", sender: nil) // Cambiar vista a MainView
        
        apiLogin()
    }

    func apiLogin(){
        
    }
    
    struct loginJSON: Decodable {
        let msg: String
        let status: Int
        let user: String?
    }

}
