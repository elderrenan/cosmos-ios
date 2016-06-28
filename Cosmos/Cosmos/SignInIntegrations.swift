//
//  SignInIntegrations.swift
//  Cosmos
//
//  Created by Matheus Aeroso on 28/06/16.
//  Copyright © 2016 Cosmos Labs. All rights reserved.
//
import Firebase

extension SignInViewController :  GIDSignInDelegate, GIDSignInUIDelegate, FBSDKLoginButtonDelegate {
    //SIGN IN BY GOOGLE
    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!, withError error: NSError!) {
        if error != nil {
            print(error!.localizedDescription)
            return
        }
        
        let authentication = user.authentication
        let credential = FIRGoogleAuthProvider.credentialWithIDToken(authentication.idToken, accessToken: authentication.accessToken)
        FIRAuth.auth()?.signInWithCredential(credential) { (user, error) in
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "isSignedIn")
        }
    }
    
    func signIn(signIn: GIDSignIn!, didDisconnectWithUser user: GIDGoogleUser!, withError error: NSError!) {
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "isSignedIn")
    }
    
    
    //FACEBOOK LOGIN SDK METHODS
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        if error != nil {
            print(error!.localizedDescription)
            return
        }
        let credential = FIRFacebookAuthProvider.credentialWithAccessToken(FBSDKAccessToken.currentAccessToken().tokenString)
        FIRAuth.auth()?.signInWithCredential(credential) { (user, error) in
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "isSignedIn")
        }
        
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "isSignedIn")
    }
    
    
}