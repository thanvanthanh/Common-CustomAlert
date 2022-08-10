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
            let vc = HomeViewController()
            self.present(vc, animated: true)
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
            let vc = HomeViewController()
            self.present(vc, animated: true)
            print("Confirm")
        }, cancelTitle: "Cancel") {
            print("Cancel")
        }
    }
    
    @IBAction func button3Action(_ sender: Any) {
        PopupHelper.share.show(viewController: self, title: "Notice",message: "Your are now leaving the Probit Global App. Press go to continue", activeTitle: "Go", activeAction: {
            let vc = HomeViewController()
            self.present(vc, animated: true)
            print("Go")
        }, cancelTitle: "Cancel") {
            print("Cancel")
        }
    
    }
    @IBAction func buttonAutoDismiss(_ sender: Any) {
        PopupHelper.share.show(viewController: self, title: "Test Auto dismiss", message: "Dismiss after 3 seconds", activeTitle: "", activeAction: nil, cancelTitle: "", cancelAction: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            // Excecute after 3 seconds
            PopupHelper.share.dismissPopup()
        }
        
    }
}

