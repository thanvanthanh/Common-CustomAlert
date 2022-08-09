//
//  UIViewExtension.swift
//
// Created by Thanh Than Van on 09/08/2022.

import UIKit

extension UIViewController {

    func showCustomAlertWith(okButtonAction: (() ->())? = {}, message: String, descMsg: String, actions: [[String: () -> Void]]?) {
        let alertVC = CommonAlertVC.init(nibName: "CommonAlertVC", bundle: nil)
        alertVC.message = message
        alertVC.arrayAction = actions
        alertVC.descriptionMessage = descMsg
        alertVC.okButtonAct = okButtonAction
        //Present
        alertVC.modalTransitionStyle = .crossDissolve
        alertVC.modalPresentationStyle = .overCurrentContext
        self.present(alertVC, animated: true, completion: nil)
    }
    
    func showAlertWithWarning(message: String, descriptionMessage: String, warningDescriptions: String, actions: [[String: () -> Void]]?) {
        let alertVC = CommonAlertVC.init(nibName: "CommonAlertVC", bundle: nil)
        alertVC.message = message
        alertVC.arrayAction = actions
        alertVC.descriptionMessage = descriptionMessage
        alertVC.warningMessage = warningDescriptions
        
        alertVC.modalTransitionStyle = .crossDissolve
        alertVC.modalPresentationStyle = .overCurrentContext
        self.present(alertVC, animated: true, completion: nil)
    }
    
}
