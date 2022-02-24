//
//  UserViewController.swift
//  Tarea2-GestionEmpleados
//
//  Created by APPS2M on 11/2/22.
//

import UIKit

class UserViewController: UIViewController {
    
    var user: UsersModel?
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userRoleLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var userSalaryLabel: UILabel!
    @IBOutlet weak var userBiographyLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let user = user {
            // Cargar nombre
            let name = user.name
            userNameLabel.text = "Welcome " + name
            // Cargar imagen
            let imageUrl = user.profileImgUrl ?? "https://friconix.com/png/fi-cnluxx-anonymous-user-circle.png"
            let url = URL(string: imageUrl)
            if let data = try? Data(contentsOf: url!){
                userImageView.image = UIImage(data: data)
            }
            
            // Cargar rol
            var role = user.job
            role = role.prefix(1).capitalized + role.dropFirst()
            userRoleLabel.text = role
            // Cargar email
            let email = user.email
            userEmailLabel.text = "Email: " + email
            // Cargar salario
            let salary = user.salary
            userSalaryLabel.text = "Salary: " + String(salary)
            // Cargar biografia
            let biography = user.biography
            userBiographyLabel.text = biography
        }
        
    }
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
