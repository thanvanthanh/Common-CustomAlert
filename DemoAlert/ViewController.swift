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
        PopupHelper.share.show(viewController: self, title: "Message",
                               message: "If you forget you PIN, you need to log in again. All default settings will be restored following PIN reset.If you forget you PIN, you need to log in again. All default settings will be restored following PIN reset.If you forget you PIN, you need to log in again. All default settings will be restored following PIN reset.If you forget you PIN, you need to log in again. All default settings will be restored following PIN reset.",
                               activeTitle: "Active",
                               activeAction: {
            print("Active")
        },
                               cancelTitle: "Cancel") {
            print("Cancel")
        }
    }
    
    @IBAction func button2Action(_ sender: Any) {
        PopupHelper.share.show(viewController: self,
                               title: "Please log in again!",
                               message: "Please the confirm button to log out",
                               warning: "*If you forget you PIN, you need to log in again. All default settings will be restored following PIN reset.",
                               activeTitle: "Confirm",
                               activeAction: {
            print("Confirm")
        }, cancelTitle: "Cancel") {
            print("Cancel")
        }
    }
    
    @IBAction func button3Action(_ sender: Any) {
        PopupHelper.share.show(viewController: self, title: "Notice",message: "Your are now leaving the Probit Global App. Press go to continue", activeTitle: "Go", activeAction: {
            print("Go")
        }, cancelTitle: "Cancel") {
            print("Cancel")
        }
    
    }
}

