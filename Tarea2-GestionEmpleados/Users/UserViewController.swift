//
//  UserViewController.swift
//  Tarea2-GestionEmpleados
//
//  Created by APPS2M on 11/2/22.
//

import UIKit

class UserViewController: UIViewController {
    
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userRoleLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var userSalaryLabel: UILabel!
    @IBOutlet weak var userBiographyLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        
    }
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
