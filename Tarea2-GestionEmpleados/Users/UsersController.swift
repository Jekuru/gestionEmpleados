//
//  UsersController.swift
//  Tarea2-GestionEmpleados
//
//  Created by APPS2M on 10/2/22.
//

import UIKit
import Alamofire

class UsersController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    let returnUserInfo: AnyObject? = UserDefaults.standard.object(forKey:"userinfo") as AnyObject
    var responseJSON: Any?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let returnToken = returnUserInfo!["api_token"] as! String
        
        let headers: HTTPHeaders = [
            .contentType("application/json"),
            .init(name: "token", value: returnToken)
        ]
        AF.request(users_url, headers: headers).responseJSON { (response) in
            if let responseValue = response.value as! [String: Any]? {
                print(responseValue)
                self.responseJSON = responseValue
                self.tableView.reloadData()
            }
        }
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        return cell
    }
    @IBAction func updateList(_ sender: Any) {
        
    }
}
