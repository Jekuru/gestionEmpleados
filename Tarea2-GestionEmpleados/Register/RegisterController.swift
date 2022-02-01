//
//  RegisterController.swift
//  Tarea2-GestionEmpleados
//
//  Created by APPS2M on 20/1/22.
//

import UIKit
import Alamofire

class RegisterController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var jobSC: UISegmentedControl!
    @IBOutlet weak var salaryField: UITextField!
    @IBOutlet weak var biographyField: UITextField!
    @IBOutlet weak var avatarField: UITextField!
    
    let userToken = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerButton(_ sender: Any) {
        let name = self.nameField.text
        let email = self.emailField.text
        let password = self.passwordField.text
        var job = ""
        
        switch (self.jobSC.selectedSegmentIndex) {
        case 0:
            job = "employee"
        case 1:
            job = "humanresources"
        case 2:
            job = "executive"
        default:
            job = "employee"
        }
        
        let salaryString = self.salaryField.text
        let salary = (salaryString! as NSString).floatValue
        let biography = self.biographyField.text
        let avatar = self.avatarField.text
        
        let register = RegisterModel(name: name!, email: email!, password: password!, job: job, salary: salary, biography: biography!, avatar: avatar!)
        APIManager.shareInstance.callingRegisterAPI(register: register, token_value: userToken){ (isSuccess, str) in
            if isSuccess{
                self.showAlert(title: "SUCCESS", message: str)
            } else {
                self.showAlert(title: "FAILED", message: str)
            }
        }
    }
}
