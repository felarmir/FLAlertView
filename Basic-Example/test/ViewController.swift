//
//  ViewController.swift
//  test
//
//  Created by Kris Penney on 2016-09-03.
//  Copyright © 2016 Kris Penney. All rights reserved.
//

import UIKit
import FLAlertView

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  @IBAction func showAlert(sender: UIButton) {
    let alert = FLAlertView(type: .success)
    alert.dismissOnOutsideTouch = true
    alert.showAlert(inView: self, withTitle: "Testing", withSubtitle: "This is a test of the alert view. Touch the Close button to hide.", withCustomImage: nil, withDoneButtonTitle: "Done", andButtons: ["first", "second"])
    
    alert.doneAction = {
        print("Done pressed")
    }
    
    alert.firstButtonAction = {
        print("first button pressed")
    }
    
    alert.secondButtonAction = {
        print("second button pressed")
    }
    
  }


  @IBAction func showAlertType2(sender: UIButton) {
    let alert = FLAlertView(type: .success)
    alert.dismissOnOutsideTouch = true
    alert.showAlert(inView: self, withTitle: "Testing", withSubtitle: "This is a test of the alert view. Touch the Close button to hide.", withCustomImage: nil, withDoneButtonTitle: "Done", andButtons: nil)
    
    alert.doneAction = {
        print("Done pressed")
    }
    
    alert.addButton("First") {
        print("first button pressed")
    }
    
    alert.addButton("Second") {
        print("second button pressed")
    }
    
  }
}
