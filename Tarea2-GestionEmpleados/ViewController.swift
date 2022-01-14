//
//  ViewController.swift
//  Tarea2-GestionEmpleados
//
//  Created by APPS2M on 11/1/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        var timer = 1
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { (Timer) in
            if timer > 0 {
                print ("\(timer) seconds")
                timer -= 1
            } else {
                Timer.invalidate()
                self.loadRegistry()
            }
        }
    }

    func loadRegistry(){
        performSegue(withIdentifier: "LoginView", sender: nil) // Cambiar vista a LoginView
    }
    


}

