//
//  AuthenViewModel.swift
//  Manage_Money
//
//  Created by Uri on 9/14/20.
//  Copyright © 2020 Uri. All rights reserved.
//

import Foundation
import Combine
import SwiftUI
class AuthenViewModel: ObservableObject{
    @ObservedObject var session: AuthenSessionStore = .share
    @ObservedObject var userData : UserData = .shared
    var subscriptions = Set<AnyCancellable>()
    let action = PassthroughSubject<Action, Never>()
    let state = CurrentValueSubject<State, Never>(.initial)
    let name = CurrentValueSubject<String, Never>("")
    let password = CurrentValueSubject<String?, Never>(nil)
    let errorText = CurrentValueSubject<String?, Never>(nil)
    
    init() {
        state.sink(receiveValue: {[weak self] state in
            self?.processState(state)
        }).store(in: &subscriptions)
        action.sink(receiveValue: { [weak self] action in
            self?.processAction(action)
        }).store(in: &subscriptions)
    }
    enum State{
        case initial
        case error(message: String)
    }
    enum Action {
        case gotoLogin
        case gotoHome
    }
    private func processState(_ state: State){
        switch state {
        case .initial:
//            name.value = userData.email
            name.assign(to: \.userData.email, on: self).store(in: &subscriptions)
            password.value = userData.password
            errorText.value = nil
        case .error(let message):
            errorText.value = message
        }
    }
    private func processAction(_ action: Action){
        switch action {
        case .gotoHome:
            print("gotoHome")
            session.signIn(email: self.userData.email, password: self.userData.password) { (auth, err) in
                if let err = err{
                    print(err)
                }else{
                    self.userData.isShowLoading = false
                }
            }
            print("Pass: \(userData.password)")
            print("VM: \(userData.email)")
            print("Local \(name.value)")
        case .gotoLogin:
            print("gotologin")
        }
    }
    func assign(){
        
    }
}


final class LoginViewModel: ObservableObject{
    static func reduce(_ state: State, _ event: Event) -> State{
        switch state {
        case .idle:
            switch event {
            case .onAppear:
                return .loading
            default:
                return state
            }
        case .loading:
            switch event {
            case .loginYet:
                return .haveSession
            case .dontLoginYet:
                return .dontSession
                
            default:
                return state
            }
        case .error:
            return state
        case .haveSession:
            return state
        case .dontSession:
            return state
        }
    }
}
extension LoginViewModel{
    enum State{
        case idle
        case loading
        case error(Error)
        case haveSession
        case dontSession
    }
    enum Event{
        case onAppear
        case loginYet
        case dontLoginYet
    }
}

