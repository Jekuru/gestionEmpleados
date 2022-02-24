//
//  MainController.swift
//  Tarea2-GestionEmpleados
//
//  Created by APPS2M on 11/1/22.
//

import UIKit

class MenuController: UIViewController {
    
    @IBOutlet weak var welcomeText: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var roleText: UILabel!
    @IBOutlet weak var emailText: UILabel!
    @IBOutlet weak var salaryText: UILabel!
    @IBOutlet weak var biographyText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Cargar nombre
        let name = Session.current.name ?? "nameLoadFail"
        welcomeText.text = "Welcome " + name
        // Cargar imagen
        let imageUrl = Session.current.profileImgUrl ?? "https://friconix.com/png/fi-cnluxx-anonymous-user-circle.png"
        let url = URL(string: imageUrl)
        if let data = try? Data(contentsOf: url!){
            avatar.image = UIImage(data: data)
        }
        
        // Cargar rol
        var role = Session.current.job ??  "jobLoadFail"
        role = role.prefix(1).capitalized + role.dropFirst()
        roleText.text = "Role: " + role
        // Cargar email
        let email = Session.current.email ?? "emailLoadFail"
        emailText.text = "Email: " + email
        // Cargar salario
        let salary = Session.current.salary ?? 0
        salaryText.text = "Salary: " + String(salary)
        // Cargar biografia
        let biography = Session.current.biography ?? "biographyLoadFail"
        biographyText.text = biography
    }

    @IBAction func logoutButton(_ sender: Any) {
        let returnToken = Session.current.token
        let logoutModel = LogoutModel(token: returnToken ?? "")
        Session.current.token = ""
        
        APIManager.shareInstance.callingLogoutAPI(logout: logoutModel, token_value: returnToken ?? ""){(isSuccess, str) in
            if isSuccess{
                self.showAlert(title: "See you later", message: str)
                UserDefaults.standard.removeObject(forKey:"userinfo")
                self.performSegue(withIdentifier: "LoginView", sender: nil) // Cambiar vista a LoginView
            } else {
                self.showAlert(title: "Sorry, but there was an error", message: str)
            }
        }
    }
    
    @IBAction func deleteUserPrefs(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey:"userinfo")
        performSegue(withIdentifier: "LoginView", sender: nil) // Cambiar vista a LoginView
    }
}
