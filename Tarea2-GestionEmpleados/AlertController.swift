//
//  Alert.swift
//  Tarea2-GestionEmpleados
//
//  Created by APPS2M on 21/1/22.
//

import UIKit

class AlertController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func onClickOK(_ sender: Any) {
        showAlert(title: "Alert!", message: "Testing")
    }
}
