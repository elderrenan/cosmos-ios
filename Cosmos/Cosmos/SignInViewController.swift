//
//  ViewController.swift
//  Cosmos
//
//  Created by Matheus Aeroso on 26/04/16.
//  Copyright © 2016 Cosmos Labs. All rights reserved.
//

import UIKit
import Firebase

class SignInViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var usernameTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    @IBOutlet weak var FBLoginButton: FBSDKLoginButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        FBLoginButton.delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().clientID = FIRApp.defaultApp()?.options.clientID
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidAppear(animated: Bool) {
        let isSignedIn = NSUserDefaults.standardUserDefaults().boolForKey("isSignedIn")
        
        if isSignedIn {
            performSegueWithIdentifier("signedInSegue", sender: self)
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //SIGN IN BY EMAIL
    @IBAction func signInByEmail(sender: AnyObject) {
        if let email = usernameTextField.text, let password = passwordTextField.text {
            FIRAuth.auth()?.signInWithEmail(email, password: password) { (user, error) in
                if error != nil {
                    let alert = UIAlertController(title: "Erro", message: "Usuário ou senha incorretos.\nPor favor tente novamente.", preferredStyle: .Alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
                    self.presentViewController(alert, animated: true, completion: nil)
                    return
                }
                NSUserDefaults.standardUserDefaults().setBool(true, forKey: "isSignedIn")
                self.performSegueWithIdentifier("signedInSegue", sender: self)
            }
        }
    }
}

