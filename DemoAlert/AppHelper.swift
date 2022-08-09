//
//  AppHelper.swift
//  DemoAlert
//
//  Created by Thanh Than Van on 09/08/2022.
//

import Foundation
import UIKit

final class AppHelper {
    
    private init() {}
    
    class func showYesNoLAlert(_ viewController: UIViewController, title: String, yesHandler: @escaping () -> Void) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let noAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
        let yesAction = UIAlertAction(title: "Yes", style: .default, handler: { _ in
            yesHandler()
        })
        
        alert.addAction(yesAction)
        alert.addAction(noAction)
        
        viewController.present(alert, animated: true, completion: nil)
    }
    
    class func presentAlert(_ viewController: UIViewController, title: String, message: String? = nil,
                            okTitle: String, okActionHandler: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let yesAction = UIAlertAction(title: okTitle, style: .cancel, handler: { _ in
            okActionHandler?()
        })
        
        alert.addAction(yesAction)
        viewController.present(alert, animated: true, completion: nil)
    }
    
    
}
