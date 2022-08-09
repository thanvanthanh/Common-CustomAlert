//
//  ViewController.swift
//  DemoAlert
//
//  Created by Thanh Than Van on 09/08/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonAction(_ sender: Any) {
        showCustomAlertWith(okButtonAction: {
            print("OK")
        }, message: "Message", descMsg: "If you forget you PIN, you need to log in again. All default settings will be restored following PIN reset.If you forget you PIN, you need to log in again. All default settings will be restored following PIN reset.If you forget you PIN, you need to log in again. All default settings will be restored following PIN reset.If you forget you PIN, you need to log in again. All default settings will be restored following PIN reset.", actions: nil)
    }
    
    @IBAction func button2Action(_ sender: Any) {
        let actionNo : [String: () -> Void] = [ "Cancel" : { (
            print("tapped NO")
        ) }]
        let actionYes : [String: () -> Void] = [ "Go" : { (
                print("tapped YES")
        ) }]
        
        let arrayActions = [actionNo, actionYes]
        showCustomAlertWith(message: "Notice", descMsg: "Your are now leaving the Probit Global App. Press go to continue", actions: arrayActions)
    }
    
    @IBAction func button3Action(_ sender: Any) {
        let actionCancel: [String: () -> Void] = [ "Cancel" : { (
            print("Cancel")
        ) }]
        let actionConfirm : [String: () -> Void] = [ "Confirm" : { (
                print("Confirm")
        ) }]
        let arrayActions = [actionCancel, actionConfirm]
        
        showAlertWithWarning(message: "Please log in again!",
                             descriptionMessage: "Please the confirm button to log out", warningDescriptions: "*If you forget you PIN, you need to log in again. All default settings will be restored following PIN reset.",
                             actions: arrayActions)
    }
    
}

