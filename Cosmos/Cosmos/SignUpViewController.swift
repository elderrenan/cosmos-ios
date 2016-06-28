//
//  SignUpViewController.swift
//  Cosmos
//
//  Created by Matheus Aeroso on 28/06/16.
//  Copyright © 2016 Cosmos Labs. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UITableViewController, UIImagePickerControllerDelegate {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func SignUp(sender: AnyObject) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            FIRAuth.auth()?.createUserWithEmail(email, password: password) {
                (user, error) in
                if error != nil {
                    print(error!.localizedDescription)
                    return
                }
                FIRAuth.auth()?.signInWithEmail(email, password: password) { (user, error) in
                    NSUserDefaults.standardUserDefaults().setBool(true, forKey: "isSignedIn")
                    self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func takePhoto(sender: AnyObject) {
        let alert = UIAlertController(title: "Erro", message: "Funcionalidade não suportada no momento.", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    @IBAction func exit(sender: AnyObject) {
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
}
