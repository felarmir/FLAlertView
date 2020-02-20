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

    
    alert.addDoneAction {
        print("Done pressed")
    }
    
    alert.addButton("First") {
        print("first button pressed")
    }
    
    alert.addButton("Second") {
        print("second button pressed")
    }
    
  }

  @IBAction func showSimpleAlert(sender: UIButton) {
    let alert = FLAlertView()
    alert.dismissOnOutsideTouch = true
    alert.showAlert(inView: self, withTitle: "FLAlert", withSubtitle: "This is a simple alert view.", withCustomImage: nil, withDoneButtonTitle: "Ok", andButtons: nil)

  }


  @IBAction func showSimpleSuccessAlert(sender: UIButton) {
    let alert = FLAlertView(type: .success)
    alert.dismissOnOutsideTouch = true
    alert.showAlert(inView: self, withTitle: nil, withSubtitle: "This is a simple success alert view.", withCustomImage: nil, withDoneButtonTitle: "Ok", andButtons: nil)

  }
    

    @IBAction func showWarning(sender: UIButton) {
        let alert = FLAlertView(type: .warning)
       alert.dismissOnOutsideTouch = true
       alert.showAlert(inView: self, withTitle: "Remove Picture", withSubtitle: "Are you sure?", withCustomImage: nil, withDoneButtonTitle: "Remove", andButtons: nil)
        
        alert.addButton("Keep", with: {})
        alert.doneAction = {
            
        }

     }
    
    //
    @IBAction func showCout(sender: UIButton) {
        let alert = FLAlertView(type: .caution)
      alert.dismissOnOutsideTouch = true
      alert.showAlert(inView: self, withTitle: "Email error", withSubtitle: "Please check your email", withCustomImage: nil, withDoneButtonTitle: "Ok", andButtons: nil)
    }
    
    
    @IBAction func showSimpleAlertWithImage(sender: UIButton) {
      let alert = FLAlertView()
      alert.dismissOnOutsideTouch = true
      alert.showAlert(inView: self, withTitle: "FLAlert", withSubtitle: "This is a simple alert view with custom image", withCustomImage: UIImage(named: "git_icon"), withDoneButtonTitle: "Ok", andButtons: nil)

    }
}
