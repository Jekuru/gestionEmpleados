//
//  ResetPasswordController.swift
//  Tarea2-GestionEmpleados
//
//  Created by APPS2M on 4/2/22.
//

import UIKit
import Alamofire

class ResetPasswordController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var userEmail: UITextField!
    @IBAction func resetPassButton(_ sender: Any) {
        guard let email = self.userEmail.text else {return}
        let modelReset = ResetPasswordModel(email: email)
        APIManager.shareInstance.callingResetAPI(reset: modelReset) { (isSuccess, str) in
            if isSuccess{
                self.showAlert(title: "Reset success", message: str)
            } else {
                self.showAlert(title: "Sorry, reset failed", message: str)
            }
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
