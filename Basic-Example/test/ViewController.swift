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
    
    
    
    @IBAction func showSimpleAlert(sender: UIButton) {
        let model = FLAlertModel(
            title: "Test title",
            subTitle: "Test subtitle. Test subtitle.Test subtitle",
            dismissOnOutsideTouch: true
        )
        let alert = FLAlertView(model: model)
        alert.addAction(title: "Cancel", type: .cancel) {
            print("Cancel 1")
        }
        alert.addAction(title: "Ok") {
            print("Ok 1")
        }
        alert.showAlert(inView: self)
    }
    
    
    @IBAction func showSimpleSuccessAlert(sender: UIButton) {
        let alert = FLAlertView(type: .success)
        alert.dismissOnOutsideTouch = true
        alert.title = "Test title"
        alert.subTitle = "Test subtitle. Test subtitle.Test subtitle"
        alert.addAction(title: "Cancel") {
            print("Cancel")
        }
        alert.addAction(title: "Ok") {
            print("Ok")
        }
        alert.showAlert(inView: self)
    }
    
    
    @IBAction func showWarning(sender: UIButton) {
        let alert = FLAlertView(type: .warning)
        alert.dismissOnOutsideTouch = true
        alert.title = "Test title"
        alert.subTitle = "Test subtitle. Test subtitle.Test subtitle"
        alert.addAction(title: "Cancel") {
            print("Cancel")
        }
        alert.addAction(title: "Ok") {
            print("Ok")
        }
        alert.showAlert(inView: self)
        
    }
    
    //
    @IBAction func showCout(sender: UIButton) {
        let alert = FLAlertView(type: .caution)
        alert.dismissOnOutsideTouch = true
        alert.title = "Test title"
        alert.subTitle = "Test subtitle. Test subtitle.Test subtitle"
        alert.addAction(title: "Cancel") {
            print("Cancel")
        }
        alert.addAction(title: "Ok") {
            print("Ok")
        }
        alert.showAlert(inView: self)
    }
    
    
    @IBAction func showSimpleAlertWithImage(sender: UIButton) {
        let alert = FLAlertView()
        alert.dismissOnOutsideTouch = true
        alert.showAlert(inView: self,
                        withTitle: "Test title",
                        withSubtitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s ",
                        withCustomImage: UIImage(named: "git_icon"),
                        withDoneButtonTitle: "Done")
        
    }
}
