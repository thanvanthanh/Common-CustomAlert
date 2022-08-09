//
//  UIViewExtension.swift
//
// Created by Thanh Than Van on 09/08/2022.

import UIKit

class CommonAlertVC: UIViewController {

    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var labelMessage: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var warningDescription: UILabel!
    
    @IBOutlet weak var buttonCancel: UIButton!
    @IBOutlet weak var buttonOkay: UIButton!
    
    var message: String = ""
    var descriptionMessage: String = ""
    var warningMessage: String = ""

    var arrayAction: [[String: () -> Void]]?
    var okButtonAct: (() ->())?

    var isContactNumberHidden: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewContainer.layer.cornerRadius = 20.0
        viewContainer.layer.masksToBounds = true
        buttonOkay.applyGradient(colours: [
            UIColor(red: 0.385, green: 0.192, blue: 0.796, alpha: 1),
            UIColor(red: 0.257, green: 0.184, blue: 0.833, alpha: 1)
          ], locations: [0.08, 1])
        buttonOkay.setCornerRadiusWith(radius: 6, borderWidth: 1, borderColor: .clear)
        
        buttonCancel.setCornerRadiusWith(radius: 6, borderWidth: 2.0, borderColor: UIColor(red: 0.784, green: 0.784, blue: 0.784, alpha: 1))
        
        self.labelMessage.text = message
        self.labelDescription.text = descriptionMessage
        self.warningDescription.text = warningMessage

        if arrayAction == nil {
            buttonCancel.isHidden = true
        } else {
            var count = 0
            for dic in arrayAction! {
                if count > 1 {
                    return
                }
                let allKeys = Array(dic.keys)
                let buttonTitle: String = allKeys[0]
                if count == 0 {
                    buttonCancel.setTitle(buttonTitle, for: .normal)
                } else {
                    buttonOkay.setTitle(buttonTitle, for: .normal)
                }
                count += 1
            }
        }       
    }

    // MARK: - IBAction Methods
    
    @IBAction func cancelButtonAction(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        if arrayAction != nil {
            let dic = arrayAction![0]
            for (_, value) in dic {
                let action: () -> Void = value
                action()
            }
        } else {
            okButtonAct?()
        }
    }
    
    @IBAction func okayButtonAction(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        if arrayAction != nil {
            let dic = arrayAction![1]
            for (_, value) in dic {
                let action: () -> Void = value
                action()
            }
        } else {
            okButtonAct?()
        }
    }
    
    static func showAlertWithTitle(_ title: String?, message : String?, actionDic : [String: (UIAlertAction) -> Void]) {
        var alertTitle : String = title!
        if title == nil {
            alertTitle = ""
        }
        let alert : UIAlertController = UIAlertController.init(title: alertTitle, message: message, preferredStyle: .alert)
        
        for (key, value) in actionDic {
            let buttonTitle : String = key
            let action: (UIAlertAction) -> Void = value
            alert.addAction(UIAlertAction.init(title: buttonTitle, style: .default, handler: action))
        }
        let keyWindow = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .compactMap({$0 as? UIWindowScene})
                .first?.windows
                .filter({$0.isKeyWindow}).first
        keyWindow!.rootViewController!.present(alert, animated: true, completion: nil)
    }

}
