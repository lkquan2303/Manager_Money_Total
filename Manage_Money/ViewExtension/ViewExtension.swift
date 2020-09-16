//
//  ViewExtension.swift
//  Manage_Money
//
//  Created by Uri on 9/8/20.
//  Copyright © 2020 Uri. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }

    func dismiss() {
//        let window = UIApplication.shared.windows.last
        UIApplication.shared.topMostController()!.dismiss(animated: true, completion: nil)
    }
    func dismissWithoutAnimation() {
    //        let window = UIApplication.shared.windows.last
            UIApplication.shared.topMostController()!.dismiss(animated: false, completion: nil)
        }


    func topMostController() -> UIViewController? {
        guard let window = UIApplication.shared.keyWindow, let rootViewController = window.rootViewController else {
            return nil
        }

        var topController = rootViewController

        while let newTopController = topController.presentedViewController {
            topController = newTopController
        }

        return topController
    }
}
