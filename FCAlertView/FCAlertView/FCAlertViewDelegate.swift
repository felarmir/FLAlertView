//
//  FCAlertViewDelegate.swift
//  FCAlertView
//
//  Created by Kris Penney on 2016-08-26.
//  Updated by Denis Andreev on 2020-02-19
//  Copyright © 2016 Kris Penney. All rights reserved.
//

import UIKit

public protocol FCAlertViewDelegate: NSObjectProtocol {
  func alertView(alertView: FCAlertView, clickedButtonIndex index: Int, buttonTitle title:String)
  
  // Optional
  func FCAlertViewDismissed(alertView: FCAlertView)
  func FCAlertViewWillAppear(alertView: FCAlertView)
  func FCAlertDoneButtonClicked(alertView: FCAlertView)
  
}

// Provide default impementation for optional methods
public extension FCAlertViewDelegate {
  func FCAlertViewDismissed(alertView: FCAlertView) {}
  func FCAlertViewWillAppear(alertView: FCAlertView) {}
  func FCAlertDoneButtonClicked(alertView: FCAlertView) {}
}
