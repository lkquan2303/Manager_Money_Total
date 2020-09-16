//
//  FLoginApp.swift
//  Manage_Money
//
//  Created by Uri on 9/6/20.
//  Copyright © 2020 Uri. All rights reserved.
//

import SwiftUI
import Firebase


struct FLoginApp: View {
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

//Connect ting Firebase

class Delegate: NSObject, UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
