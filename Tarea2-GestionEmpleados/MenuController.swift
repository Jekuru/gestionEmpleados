//
//  MainController.swift
//  Tarea2-GestionEmpleados
//
//  Created by APPS2M on 11/1/22.
//

import UIKit

class MenuController: UIViewController {
    
    @IBOutlet weak var welcomeText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let returnUsername: String? = UserDefaults.standard.object(forKey: "username") as? String
        welcomeText.text = "Bienvenido " + returnUsername!
    }

}
