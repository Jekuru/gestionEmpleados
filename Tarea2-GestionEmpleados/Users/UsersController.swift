//
//  UsersController.swift
//  Tarea2-GestionEmpleados
//
//  Created by APPS2M on 10/2/22.
//

import UIKit
import Alamofire

class UsersController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var usersArray: [UsersModel]?
    
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
        let returnToken = Session.current.token
        APIManager.shareInstance.callingGetAllUsersAPI(token: returnToken ?? "") { [self] (result) in
            switch result{
            case .success(let responseUsers):
                // OK
                self.usersArray = responseUsers as? [UsersModel]
                tableView.reloadData()
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
        tableView.reloadData()
    }
    
    // TABLE VIEW
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        performSegue(withIdentifier: "showDetails", sender: indexPath)
        print("Clicked", indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showDetails") {
            let userDetailVC = segue.destination as! UserViewController
            let indexPath = sender as! IndexPath
            
            userDetailVC.user = usersArray?[indexPath.row]
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UsersTableViewCell
        cell.user = usersArray?[indexPath.row]
        return cell
    }
}

class UsersTableViewCell: UITableViewCell {
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userNameText: UILabel!
    @IBOutlet weak var userRoleText: UILabel!
    
    public var user: UsersModel? {
        didSet { setupInfo() }
    }
    
    private func setupInfo() {
        guard let user = user else { return }
        
        // Cargar nombre
        userNameText.text = user.name
        
        // Cargar rol
        switch user.job {
        case "employee":
            userRoleText.text = "Employee"
        case "humanresources":
            userRoleText.text = "Human Resources"
        case "executive":
            userRoleText.text = "Executive"
        default:
            userRoleText.text = "Please wait..."
        }
        
        // Cargar imagen
        var url = URL(string: user.profileImgUrl ?? "")
        if (url == nil){
            url = URL(string: "https://www.kananss.com/wp-content/uploads/2021/06/51-519068_loader-loading-progress-wait-icon-loading-icon-png-1.png")
        }
        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        if let imageData = data {
            userImage.image = UIImage(data: imageData)
        }
    }
}
