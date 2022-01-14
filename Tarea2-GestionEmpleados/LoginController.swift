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
        // Si el login es correcto...
        //performSegue(withIdentifier: "MainView", sender: nil) // Cambiar vista a MainView
        
        apiLogin()
    }

    func apiLogin(){
        let url = URL(string: "http://kurokiji.com/api/login")
        let json = ["email": emailField.text,
                    "password": passField.text]
        AF.request(url!, method: .put, parameters: json).responseJSON { response in
            let responseJSON = response
            print(responseJSON)
        }
    }
    
    

}
