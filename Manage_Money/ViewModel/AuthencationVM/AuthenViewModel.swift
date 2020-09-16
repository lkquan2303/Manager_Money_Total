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
    @EnvironmentObject var session: AuthenSessionStore
    @ObservedObject var userData : UserData = .shared
    var subscriptions = Set<AnyCancellable>()
    var authenAction = AuthenSessionStore()
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
//            password.value = userData.password
            errorText.value = nil
        case .error(let message):
            errorText.value = message
        }
    }
    private func processAction(_ action: Action){
        switch action {
        case .gotoHome:
            print("gotoHome")
            session.signIn(handle: <#T##AuthDataResultCallback##AuthDataResultCallback##(AuthDataResult?, Error?) -> Void#>)
            print("VM: \(userData.email)")
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

