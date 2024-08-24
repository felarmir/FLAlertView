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
    var autoHideSeconds = 0
    var colorScheme: UIColor?
    var titleColor: UIColor = .black
    var subTitleColor: UIColor = .black
    var dismissOnOutsideTouch = false
    
    public init(
        title: String? = nil,
        subTitle: String? = nil,
        alertImage: UIImage? = nil,
        autoHideSeconds: Int = 0,
        colorScheme: UIColor? = nil,
        titleColor: UIColor,
        subTitleColor: UIColor,
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
