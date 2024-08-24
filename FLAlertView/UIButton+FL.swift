//
//  UIButton+FL.swift
//  FLAlertView
//
//  Created by Denis Andreev on 01.02.2021.
//

import UIKit
import ObjectiveC

private var actionKey: UInt8 = 0

extension UIButton {
    private func actionHandler(action: (() -> Void)? = nil) {
        if let action = action {
            objc_setAssociatedObject(self, &actionKey, action, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        } else {
            if let action = objc_getAssociatedObject(self, &actionKey) as? () -> Void {
                action()
            }
        }
    }
    
    @objc private func triggerActionHandler() {
        self.actionHandler()
    }
    
    func actionHandler(for controlEvents: UIControl.Event, action: @escaping () -> Void) {
        self.actionHandler(action: action)
        self.addTarget(self, action: #selector(triggerActionHandler), for: controlEvents)
    }
}
