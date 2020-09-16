//
//  CustomTextField.swift
//  Manage_Money
//
//  Created by Uri on 9/7/20.
//  Copyright © 2020 Uri. All rights reserved.
//

import SwiftUI

struct CustomTextField: View {
    var image: String
    var placeHolder: String
    @Binding var txt: String
    var body: some View{
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)){
            Image(systemName: image)
                .font(.system(size: 24))
                .foregroundColor(Color(.white))
                .frame(width: 60, height: 60)
                .clipShape(Circle())
            
            ZStack{
                if placeHolder == "Password" || placeHolder == "Re-Password"{
                    SecureField(placeHolder, text: $txt)
                }else{
                    TextField(placeHolder, text: $txt)
                }
            }
            .padding(.horizontal)
            .padding(.leading, 55)
            .frame(height: 60)
            .background(Color.white.opacity(0.4))
            .clipShape(Capsule())
        }.padding(.horizontal)
    }
}
