//
//  LoadingPageView.swift
//  Manage_Money
//
//  Created by Uri on 9/14/20.
//  Copyright © 2020 Uri. All rights reserved.
//

import SwiftUI

struct LoadingPageView: View {
    @State private var animateStorekeStart = true
    @State private var animateStrokeEnd = true
    @State private var isRotating = false
    var body: some View {
        ZStack{
            ZStack{
                Color.gray.opacity(0.5)
            }.edgesIgnoringSafeArea(.all)
            Images.loading
            Circle()
                .trim(from: animateStorekeStart ? 1/3 : 1/9, to: animateStrokeEnd ? 2/5 : 1)
                .stroke(lineWidth: 3)
                .frame(width: 50, height: 50)
                .foregroundColor(Color.orange)
                .rotationEffect(.degrees(isRotating ? 360 : 0))
                .onAppear(){
                    withAnimation(
                        Animation.linear(duration: 1)
                            .repeatForever(autoreverses: false)
                        )
                    {
                        self.isRotating.toggle()
                    }
                    withAnimation (
                        Animation.linear(duration: 1).delay(0.5).repeatForever(autoreverses: true)
                    ){
                        self.animateStorekeStart.toggle()
                    }
                    withAnimation(Animation.linear(
                        duration: 1
                    ).delay(0.5).repeatForever(autoreverses: true)){
                        self.animateStrokeEnd.toggle()
                    }
            }
        }
    }
}

struct LoadingPageView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingPageView()
    }
}
