//
//  ErrorView.swift
//  Manage_Money
//
//  Created by Uri on 9/12/20.
//  Copyright © 2020 Uri. All rights reserved.
//

import SwiftUI

struct ErrorView: View {
    @Binding var alert: Bool
    var body: some View {
        GeometryReader{_ in
            VStack{
                HStack{
                    Text("Error")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black.opacity(0.7))
                    Spacer()
                }
                .padding(.horizontal, 25)
                Text("Email or Password  invalid!!!!")
                    .font(.system(size: 20))
                    .foregroundColor(Color.orange)
                    .padding(.top)
                    .padding(.horizontal, 25)
                Button(action: {
                    self.alert.toggle()
                }) {
                    Text("Cancel")
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 120)
                }
                .background(Color.orange)
                .cornerRadius(10)
                .padding(.top, 25)
            }
            .padding(.vertical, 25)
            .frame(width: UIScreen.main.bounds.width - 70)
            .background(Color.white)
            .cornerRadius(15)
        }
        .background(Color.black.opacity(0.35))
        .edgesIgnoringSafeArea(.all)
    }
}

