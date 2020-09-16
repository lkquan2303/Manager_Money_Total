//
//  AuthenSessionStore.swift
//  Manage_Money
//
//  Created by Uri on 9/14/20.
//  Copyright © 2020 Uri. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import Firebase

class AuthenSessionStore: ObservableObject{
    static let share = AuthenSessionStore()
    var didChange = PassthroughSubject<AuthenSessionStore, Never>()
    var handle: AuthStateDidChangeListenerHandle?
    @Published var session: User? {didSet {self.didChange.send(self)}}
    func listen(){
        handle = Auth.auth().addStateDidChangeListener({(auth, user) in
            if let user = user{
                self.session = User(uid: user.uid, email: user.email!)
            } else{
                self.session = nil
            }
        })
    }
    func signUp(email: String, password: String, handle: @escaping AuthDataResultCallback){
        Auth.auth().createUser(withEmail: email, password: password, completion: handle)
    }
    func signIn(email: String, password: String, handle: @escaping AuthDataResultCallback){
        Auth.auth().signIn(withEmail: email, password: password, completion: handle)
    }
    func signOut(){
        do{
            try Auth.auth().signOut()
            self.session = nil
        } catch{
            print("error")
        }
    }
    func unBind(){
        if let handle = handle{
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    func resetPassword(){
        let alert = UIAlertController(title: "Reset Password", message: "Enter your E-Mail ID to Reset Your Password", preferredStyle: .alert)
        
        alert.addTextField{(email) in
            email.placeholder = "Email"
        }
        let proceed = UIAlertAction(title: "Reset", style: .default){(_) in
            //            self.model.resetEmail = alert.textFields![0].text!
            //          self.model.isLinkSend = true
            if alert.textFields![0].text! != ""{
                Auth.auth().sendPasswordReset(withEmail: alert.textFields![0].text!) { (err) in
 //                   self.userData.isLinkSend.toggle()
                    if err != nil{
                       
                    }
                }
            }
            
        }
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        
        alert.addAction(cancel)
        alert.addAction(proceed)
        
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)
    }
    deinit {
        unBind()
    }
}
