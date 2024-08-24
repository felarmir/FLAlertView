//
//  Enums.swift
//  FLAlertView
//
//  Created by Denis Andreev on 01.02.2021.
//

import Foundation

/// Types of alerts that can be displayed.
public enum FLAlertType {
    /// Represents a cautionary alert, typically used for non-critical warnings or notifications.
    case caution
    
    /// Represents a success alert, typically used to indicate successful completion of an operation.
    case success
    
    /// Represents a warning alert, typically used for more serious alerts that require user attention.
    case warning
}

/// Types of buttons that can be displayed in an alert.
public enum FLButtonType {
    /// Represents a default button, typically used for neutral actions.
    case defaultButton
    
    /// Represents a done button, typically used to indicate the completion of an action.
    case done
    
    /// Represents a cancel button, typically used to dismiss the alert without taking action.
    case cancel
}

/// Constants used for configuring the appearance and layout of alerts.
enum FLAlertConstants {
    /// The height of the alert view.
    static let height: CGFloat = 200
    
    /// The spacing between elements within the alert view.
    static let spacing: CGFloat = 105
    
    /// The height of the buttons in the alert view.
    static let buttonHeight: CGFloat = 45
    
    /// The corner radius of the alert view.
    static let cornerRadius: CGFloat = 18
}

