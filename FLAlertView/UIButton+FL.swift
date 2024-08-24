//
//  UIButton+FL.swift
//  FLAlertView
//
//  Created by Denis Andreev on 01.02.2021.
//

import UIKit

extension UIButton {
    private func actionHandler(action:(() -> Void)? = nil) {
        struct __ {
            static var alertActions = [String: ()->Void]()
        }
        
        if action != nil {
            __.alertActions[self.titleLabel!.text!] = action
        } else {
            __.alertActions[self.titleLabel!.text!]?()
        }
    }
    
    @objc private func triggerActionHandler() {
        self.actionHandler()
    }
    
    func actionHandler(controlEvents control :UIControl.Event, forAction action: @escaping () -> Void) {
        self.actionHandler(action: action)
        self.addTarget(self, action: #selector(triggerActionHandler), for: control)
    }
}
