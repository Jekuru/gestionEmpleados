//
//  MainController.swift
//  Tarea2-GestionEmpleados
//
//  Created by APPS2M on 11/1/22.
//

import UIKit

class MenuController: UIViewController {
    
    let returnUserInfo: AnyObject? = UserDefaults.standard.object(forKey:"userinfo") as AnyObject
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
        let username = returnUserInfo!["name"] as? String ?? ""
        welcomeText.text = "Welcome " + username
        // Cargar imagen
        let imageUrl = returnUserInfo!["profileImgUrl"] as? String ?? "https://friconix.com/png/fi-cnluxx-anonymous-user-circle.png"
        let url = URL(string: imageUrl)
        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        avatar.image = UIImage(data: data!)
        // Cargar rol
        var role = returnUserInfo!["job"] as? String ?? "jobLoadFail"
        role = role.prefix(1).capitalized + role.dropFirst()
        roleText.text = "Role: " + role
        // Cargar email
        let email = returnUserInfo!["email"] as? String ?? "emailLoadFail"
        emailText.text = "Email: " + email
        // Cargar salario
        let salary = returnUserInfo!["salary"] as? Int ?? 0
        salaryText.text = "Salary: " + String(salary)
        // Cargar biografia
        let biography = returnUserInfo!["biography"] as? String ?? "biographyLoadFail"
        biographyText.text = biography
    }

    @IBAction func logoutButton(_ sender: Any) {
        let returnToken = returnUserInfo!["api_token"] as? String ?? "tokenFail"
        let logoutModel = LogoutModel(token: returnToken)
        
        APIManager.shareInstance.callingLogoutAPI(logout: logoutModel, token_value: returnToken){(isSuccess, str) in
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
