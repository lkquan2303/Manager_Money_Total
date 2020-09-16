//
//  HomePageView.swift
//  Manage_Money
//
//  Created by Uri on 9/7/20.
//  Copyright © 2020 Uri. All rights reserved.
//

import SwiftUI

struct HomePageView: View {
    @State var nowDay = Date()
    @State var isShowDayPicker = false
    @State var isPickMoney = false
    @EnvironmentObject var session: AuthenSessionStore
    var body: some View {
            ZStack{
                ZStack{
                    isShowDayPicker ? Color.gray.opacity(0.3) : Color.clear
                }.onTapGesture {
                    self.isShowDayPicker.toggle()
                }
                .edgesIgnoringSafeArea(.all)
                VStack{
                    HStack{
                        Spacer()
                        HStack{
                            Button(action: {
                                self.isPickMoney = false
                            }) {
                                Text("Tiền chi")
                                    .foregroundColor(isPickMoney ? Color.orange : Color.white)
                                    .padding(.vertical, 5)
                                    .padding(.horizontal, 30)
                            }
                            .background(isPickMoney ? Color.gray.opacity(0.2) : Color.orange)
                            .cornerRadius(8)
                            Spacer().frame(width: 0)
                            Button(action: {
                                self.isPickMoney = true
                            }) {
                                Text("Tiền thu")
                                    .foregroundColor(isPickMoney ? Color.white : Color.orange)
                                    .padding(.vertical, 5)
                                    .padding(.horizontal, 30)
                            }
                            .background(isPickMoney ? Color.orange : Color.gray.opacity(0.2))
                            .cornerRadius(8)
                        }
                        Spacer()
                    }.disabled(isShowDayPicker == true)
                        .padding(.top, 20)
                    HeaderView(nowDay: $nowDay, isMoney: $isPickMoney, isShowDayPicker: $isShowDayPicker)
                        .padding(.top, 20)
                    BuildListSpending()
                    Button(action: {
                        self.session.signOut()
                    }) {
                        Text("SignOut")
                    }
                    Spacer()
                }
                DayPickerView(nowDay: $nowDay, isShowTime: $isShowDayPicker)
                    .offset(y: self.isShowDayPicker ? 0 : UIScreen.main.bounds.height)
                    .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.9, blendDuration: 0.6))
            }
        
        
    }
}

