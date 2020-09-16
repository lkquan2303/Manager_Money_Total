//
//  Images.swift
//  Manage_Money
//
//  Created by Uri on 9/8/20.
//  Copyright © 2020 Uri. All rights reserved.
//

import Foundation
import SwiftUI

struct Images {
    
    //List Spending
    static var exchange = Image("beer")
    static var cosmetics = Image("cosmetics")
    static var clothing = Image("clothing")
    static var bus = Image("electric-bus")
    static var dailyspending = Image("expense")
    static var home = Image("home-run")
    static var food = Image("kitchen")
    static var pharmacy = Image("pharmacy")
    static var contact = Image("phone")
    static var education = Image("school")
    static var elecwater = Image("water-drop")
    static var wedding = Image("wedding-cake")
    static var arrowLeft = Image(systemName: "chevron.left")
    static var arrowRight = Image(systemName: "chevron.right")
    static var loading = Image("loan")
    //Authen
    static var person = "person"
    static var lock = "lock"
}
struct ListSpendingCategory: Identifiable{
    var id = UUID()
    var image: Image
    var nameSpending: String
}
//let listImage:[Image] = [Images.food, Images.dailyspending, Images.clothing, Images.cosmetics, Images.exchange, Images.pharmacy, Images.education, Images.elecwater, Images.bus, Images.contact, Images.home, Images.wedding]

let listSpendingCategory = [
    ListSpendingCategory(image: Images.food, nameSpending: "Ăn uống"),
    ListSpendingCategory(image: Images.dailyspending, nameSpending: "Hàng ngày"),
    ListSpendingCategory(image: Images.clothing, nameSpending: "Quần áo"),
    ListSpendingCategory(image: Images.cosmetics, nameSpending: "Mỹ phẩm"),
    ListSpendingCategory(image: Images.exchange, nameSpending: "Giao lưu"),
    ListSpendingCategory(image: Images.pharmacy, nameSpending: "Y tế"),
    ListSpendingCategory(image: Images.education, nameSpending: "Giáo dục"),
    ListSpendingCategory(image: Images.elecwater, nameSpending: "Điện, nước"),
    ListSpendingCategory(image: Images.bus, nameSpending: "Đi lại"),
    ListSpendingCategory(image: Images.contact, nameSpending: "Liên lạc"),
    ListSpendingCategory(image: Images.home, nameSpending: "Tiền nhà"),
    ListSpendingCategory(image: Images.wedding, nameSpending: "Khác(Đám cưới,...)"),
]

