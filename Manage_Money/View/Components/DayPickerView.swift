//
//  DayPickerView.swift
//  Manage_Money
//
//  Created by Uri on 9/7/20.
//  Copyright © 2020 Uri. All rights reserved.
//

import SwiftUI

struct DayPickerView:View {
    var dateFormatter: DateFormatter{
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d, hh:mm a"
        return formatter
    }
    @Binding var nowDay: Date
    @Binding var isShowTime: Bool
    let calender = Calendar.current
    var body: some View{
        VStack{
            Spacer()
            VStack{
                DatePicker(selection: $nowDay,displayedComponents: .date, label: {
                    Text("HI")
                }).labelsHidden().frame(width: UIScreen.main.bounds.width - 15).background(Color.white)
                HStack{
                    HStack{
                        Spacer()
                        Button(action: {
                            self.isShowTime.toggle()
                            self.nowDay = Date()
                        }) {
                            Text("Cancel").foregroundColor(.red).font(.system(size: 20))
                        }
                        Spacer()
                    }
                    Divider().foregroundColor(Color.gray)
                    HStack{
                        Spacer()
                        Button(action: {
                            self.isShowTime.toggle()
                        }) {
                            Text("Select").font(.system(size: 20)).fontWeight(.bold)
                        }
                        Spacer()
                    }
                }.frame(width: UIScreen.main.bounds.width - 15, height: 50).background(Color.white).cornerRadius(15)
            }
            
        }
    }
}
extension Date {
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }
    
    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
}
