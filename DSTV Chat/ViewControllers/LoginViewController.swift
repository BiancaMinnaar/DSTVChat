//
//  LoginViewController.swift
//  DSTV Chat
//
//  Created by Bianca Minnaar on 2016/10/13.
//  Copyright © 2016 BonsaiSoft. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var userNameTestField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var logedInUser:UserLoginResult!
    var loginSuccess = false;
    
    func testLogin(with userName: String?, password:String?) {
        
        Networking.LoginUser(withUserName: userName, password: password) { (loginResult) in
            self.logedInUser = loginResult
            if loginResult.Result! {
                self.performSegue(withIdentifier: "idLoginSeque", sender: nil)
            } else {
                let alertController = UIAlertController(title: "DSTV Login Error", message:
                    "Your login credentials were incorrect!!", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
                
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func performLogin(_ sender: AnyObject) {
        testLogin(with: userNameTestField.text, password: passwordTextField.text)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "idLoginSeque"){
            let navVC:MainNavViewController = segue.destination as! MainNavViewController
            let tableVC = navVC.viewControllers.first as! FriendsTableViewController
            tableVC.logedInUser = logedInUser
        }
    }
}
