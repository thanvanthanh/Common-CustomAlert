//
//  PopUpHelper.swift
//  DemoAlert
//
//  Created by Thanh Than Van on 09/08/2022.
//

import UIKit

typealias Action = (() -> Void)

class PopupHelper {
    static let share = PopupHelper()
    
    var destinationViewController: UIViewController?
    
    func show(viewController: UIViewController,
              title: String?,
              message: String?,
              warning: String? = nil,
              activeTitle: String?,
              activeAction: Action?,
              cancelTitle: String?,
              cancelAction: Action?) {
        
        let alertVC = CommonAlertVC.init(nibName: "CommonAlertVC", bundle: nil)
        alertVC
            .load()
            .setTitle(title)
            .setMessage(message)
            .setWarning(warning)
            .setActiveButton(activeTitle)
            .setActiveButton(activeAction)
            .setCancelButton(cancelTitle)
            .setCancelButton(cancelAction)
        destinationViewController = alertVC
        
        alertVC.modalPresentationStyle = .overCurrentContext
        alertVC.modalTransitionStyle = .crossDissolve
        viewController.present(alertVC, animated: true)
    }
    
    func dismissPopup(){
        destinationViewController?.dismiss(animated: false)
    }
}
