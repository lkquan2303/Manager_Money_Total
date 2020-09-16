//
//  MoneySpendingView.swift
//  Manage_Money
//
//  Created by Uri on 9/7/20.
//  Copyright © 2020 Uri. All rights reserved.
//

import SwiftUI
import QGrid
struct MoneySpendingView: View {
    var body: some View {
        QGrid(listSpendingCategory, columns: 3, vPadding: 30){item in
            BuildListSpending()
        }
    }
}

struct BuildListSpending: View {
    //    @State var itemSpending: ListSpendingCategory
    var body: some View{
        VStack{
            HStack{
                CustomSpendingItem(idSpending: 0)
                CustomSpendingItem(idSpending: 1)
                CustomSpendingItem(idSpending: 2)
            }
            HStack{
                CustomSpendingItem(idSpending: 3)
                CustomSpendingItem(idSpending: 4)
                CustomSpendingItem(idSpending: 5)
            }
            HStack{
                CustomSpendingItem(idSpending: 6)
                CustomSpendingItem(idSpending: 7)
                CustomSpendingItem(idSpending: 8)
            }
            HStack{
                CustomSpendingItem(idSpending: 9)
                CustomSpendingItem(idSpending: 10)
                CustomSpendingItem(idSpending: 11)
            }
        }
    }
}
