//
//  SignUpView.swift
//  Manage_Money
//
//  Created by Uri on 9/7/20.
//  Copyright © 2020 Uri. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
    @State var model = ModelData()
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var session : AuthenSessionStore
    @EnvironmentObject var userData : UserData
    var body: some View{
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)){
            VStack{
                Image("logo")
                    .frame(width: UIScreen.main.bounds.width)
                    .padding(.horizontal)
                    .padding(.vertical, 20)
                VStack{
                    HStack{
                        Text("New").font(.system(size: 30)).fontWeight(.bold).foregroundColor(Color.white)
                        Text("Profile").font(.system(size: 30)).fontWeight(.bold).foregroundColor(Color(.yellow))
                    }
                    Text("Create a pofile for you !!!").opacity(0.5)
                }
                VStack(spacing: 20){
                    CustomTextField(image: "person", placeHolder: "Email", txt: $model.emailSignup)
                    CustomTextField(image: "lock", placeHolder: "Password", txt: $model.passwordSignUp)
                    CustomTextField(image: "lock", placeHolder: "Re-Password", txt: $model.rePasswordSignUp)
                }
                .padding(.horizontal)
                .padding(.top)
                
                Button(action: {
                    self.userData.isShowLoading.toggle()
                    self.session.signUp(email: self.userData.email, password: self.userData.password) { (result, error) in
                        if let error = error{
                            print(error)
                        }else{
                            self.model.emailSignup = ""
                            self.model.passwordSignUp = ""
                            self.model.rePasswordSignUp = ""
                        }

                    }
                }) {
                    Text("SIGNUP")
                        .foregroundColor(Color.orange)
                        .fontWeight(.bold)
                        .frame(width: UIScreen.main.bounds.width - 30)
                        .padding(.vertical)
                        .background(Color.white)
                        .cornerRadius(30)
                        .padding(.top, 15)
                }
                
                Spacer(minLength: 0)
            }
            Button(action: {
                withAnimation{
//                    self.isShowSignUp = false
                    self.userData.isSignUp.toggle()
                }                
            }) {
                Images.arrowLeft
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.white.opacity(0.4))
                    .clipShape(Circle())
            }
            .padding(.leading, 30)
        }
        .padding(.top, 25)
        .background(LinearGradient(gradient: .init(colors: [.yellow, .orange]), startPoint: .top, endPoint: .bottom))
    }
}
