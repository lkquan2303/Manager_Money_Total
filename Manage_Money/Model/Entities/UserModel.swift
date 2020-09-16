//
//  UserModel.swift
//  Manage_Money
//
//  Created by Uri on 9/14/20.
//  Copyright © 2020 Uri. All rights reserved.
//

import Foundation

struct User{
    var userData = UserData()
    var uid: String
    var email: String
    init(uid: String, email: String) {
        self.uid = uid
        self.email = userData.email
    }
}

class UserData: ObservableObject{
    static let shared = UserData()
    @Published var isAlert = false
    @Published var isError = false
    @Published var isSignUp = false
    @Published var isLinkSend = false
    @Published var email = ""
    @Published var password = ""
    @Published var emailSignup = ""
    @Published var passwordSignUp = ""
    @Published var resetEmail = ""
    @Published var rePasswordSignUp = ""
    @Published var isShowLoading = false
}

struct UserMVVM {
    var name: String = ""
    var password: String = ""
    var isLogin: Bool = true
}
