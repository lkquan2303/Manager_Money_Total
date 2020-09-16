//
//  FLogin.swift
//  Manage_Money
//
//  Created by Uri on 9/7/20.
//  Copyright © 2020 Uri. All rights reserved.
//

import SwiftUI
import Firebase
import Combine
//MVVM Model
class ModelData: ObservableObject{
    @Published var isSignUp = false
    @Published var isLinkSend = false
    @Published var email = ""
    @Published var password = ""
    @Published var emailSignup = ""
    @Published var passwordSignUp = ""
    @Published var resetEmail = ""
    @Published var rePasswordSignUp = ""
}

