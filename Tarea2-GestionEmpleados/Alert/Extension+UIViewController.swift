//
//  Extension+UIViewController.swift
//  Tarea2-GestionEmpleados
//
//  Created by APPS2M on 21/1/22.
//

import Foundation
import UIKit

extension UIViewController{
    func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
}
