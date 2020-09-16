//
//  HeaderView.swift
//  Manage_Money
//
//  Created by Uri on 9/8/20.
//  Copyright © 2020 Uri. All rights reserved.
//

import SwiftUI

struct HeaderView: View {
    let f = DateFormatter()
    @Binding var nowDay: Date
    @State var note = ""
    @State var moneyNumber = 0
    @Binding var isMoney: Bool
    @Binding var isShowDayPicker: Bool
    @Environment(\.presentationMode) var presentationMode
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Text("Ngày")
                    Spacer()
                    HStack{
                        Button(action: {
                            self.nowDay.addTimeInterval(-86400)
                        }) {
                            Images.arrowLeft
                        }
                        HStack{
                            Button(action: {
                                self.isShowDayPicker = true
                            }) {
                                Text("\(nowDay, formatter: dateFormatter) \(f.weekdaySymbols[Calendar.current.component(.weekday, from: nowDay) - 1])")
                                    .foregroundColor(Color.black)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 6)
                            }
                        }.background(Color.yellow.opacity(0.15))
                        Button(action: {
                            self.nowDay.addTimeInterval(86400)
                        }) {
                            Images.arrowRight
                        }
                    }
                    Spacer()
                }
                Divider()
                HStack{
                    Text("Ghi chú")
                    TextField("Ghi chú", text: $note)
                        .padding(.horizontal).disabled(isShowDayPicker == true)
                }
                Divider()
                HStack{
                    Text(isMoney ? "Tiền chi" : "Tiền thu")
                    HStack{
                        NumberTextField(value: $moneyNumber)
                            .disabled(isShowDayPicker == true)
                            .frame(height: 40)
                            .padding(.horizontal)
                    }
                    .background(Color.yellow.opacity(0.15))
                    .padding(.leading, 8)
                    Text("VND").font(.system(size: 13))
                }
                Divider()
            }
            .padding(.horizontal)
        }
        
    }
}

