//
//  Enums.swift
//  FLAlertView
//
//  Created by Denis Andreev on 01.02.2021.
//

import Foundation

/// Alert types
public enum FLAlertType {
    case caution
    case success
    case warning
}

/// Button types
public enum FLButtonType {
    case defaultButton
    case done
    case cancel
}


enum FLAlertConstants {
    static let height: CGFloat = 200
    static let spacing: CGFloat = 105
    static let buttonHeight: CGFloat = 45
    static let cornerRadius: CGFloat = 18
}
