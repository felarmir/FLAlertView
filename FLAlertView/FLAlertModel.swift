//
//  FLAlertModel.swift
//
//
//  Created by Denis Andreev on 24.08.2024.
//

import UIKit

public struct FLAlertModel {
    var title: String?
    var subTitle: String?
    var alertImage: UIImage?
    var autoHideSeconds: Int
    var colorScheme: UIColor?
    var titleColor: UIColor
    var subTitleColor: UIColor
    var dismissOnOutsideTouch: Bool
    
    public init(
        title: String? = nil,
        subTitle: String? = nil,
        alertImage: UIImage? = nil,
        autoHideSeconds: Int = 0,
        colorScheme: UIColor? = nil,
        titleColor: UIColor = .black,
        subTitleColor: UIColor = .black,
        dismissOnOutsideTouch: Bool = false)
    {
        self.title = title
        self.subTitle = subTitle
        self.alertImage = alertImage
        self.autoHideSeconds = autoHideSeconds
        self.colorScheme = colorScheme
        self.titleColor = titleColor
        self.subTitleColor = subTitleColor
        self.dismissOnOutsideTouch = dismissOnOutsideTouch
    }
}
