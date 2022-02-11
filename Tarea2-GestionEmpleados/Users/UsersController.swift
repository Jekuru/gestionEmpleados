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
    var responseJSON: AnyObject?
    
    @IBOutlet weak var tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        getUsersDataNew()
    }

    @IBAction func updateList(_ sender: Any) {
        getUsersDataNew()
    }
    
    func getUsersDataNew(){
        let returnToken = returnUserInfo!["api_token"] as! String
        APIManager.shareInstance.callingGetAllUsersAPI(token: returnToken) { [self] (result) in
            switch result{
            case .success(let json):
                // OK
                let usersInfo = (json as AnyObject).value(forKey: "data") as AnyObject
                responseJSON = usersInfo
                print(responseJSON!)
                tableView.reloadData()
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
        tableView.reloadData()
    }
    
    // TABLE VIEW
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? UsersController {
            
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rowCount: Int = responseJSON?.count ?? 1
        return rowCount
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UsersTableViewCell
        let names: Array = responseJSON?.value(forKey: "name") as? Array<String> ?? ["Loading data...", "Please wait..."]
        let roles: Array = responseJSON?.value(forKey: "job") as? Array<String> ?? ["Loading data...", "Please wait..."]
        let imageUrl: Array = responseJSON?.value(forKey: "profileImgUrl") as? Array<String> ?? ["Loading data...", "Please wait..."]
        
        // Cargar nombre
        cell.userNameText.text = names[indexPath.row]
        // Cargar rol
        switch roles[indexPath.row] {
        case "employee":
            cell.userRoleText.text = "Employee"
        case "humanresources":
            cell.userRoleText.text = "Human Resources"
        case "executive":
            cell.userRoleText.text = "Executive"
        default:
            cell.userRoleText.text = "Can't retrieve role, please update."
        }
        
        // Cargar imagen
        var url = URL(string: imageUrl[indexPath.row])
        if (url == nil){
            url = URL(string: "https://www.kananss.com/wp-content/uploads/2021/06/51-519068_loader-loading-progress-wait-icon-loading-icon-png-1.png")
        }
        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        if let imageData = data {
            cell.userImage.image = UIImage(data: imageData)
        }
        
        // https://friconix.com/png/fi-cnluxx-anonymous-user-circle.png
        return cell
    }
}
class UsersTableViewCell: UITableViewCell {
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userNameText: UILabel!
    @IBOutlet weak var userRoleText: UILabel!
}
