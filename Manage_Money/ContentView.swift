//
//  ContentView.swift
//  Manage_Money
//
//  Created by Uri on 9/4/20.
//  Copyright © 2020 Uri. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var session: AuthenSessionStore
    func getUser(){
        session.listen()
    }
    @State var isMoney = false
    var body: some View {
        Group{
            if(session.session != nil){
                HomePageView()
            }else{
                SignInView()
            }
        }.onAppear(perform: getUser)
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
