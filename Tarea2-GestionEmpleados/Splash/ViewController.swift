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
                if (self.checkToken())
                {
                    self.loadMainView()
                } else {
                    self.loadLoginView()
                }
                
            }
        }
    }
    
    func checkToken() -> Bool{
            if((UserDefaults.standard.object(forKey: "userinfo")) != nil){
                let returnUserInfo: AnyObject? = UserDefaults.standard.object(forKey:"userinfo") as AnyObject
                let token = returnUserInfo!["api_token"] as! String
                print(token)
                return true
            } else {
                print("No hay token")
                return false
            }
    }

    func loadLoginView(){
        dismiss(animated: true, completion: nil)
        performSegue(withIdentifier: "LoginView", sender: nil) // Cambiar vista a LoginView
    }
    
    func loadMainView(){
        dismiss(animated: true, completion: nil)
        performSegue(withIdentifier: "MenuView", sender: nil) // Cambiar vista a MainView
    }
    


}

