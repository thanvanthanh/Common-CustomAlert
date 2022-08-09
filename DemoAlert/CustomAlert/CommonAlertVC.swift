//
//  UIViewExtension.swift
//
// Created by Thanh Than Van on 09/08/2022.

import UIKit

class CommonAlertVC: UIViewController {

    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var warningDescription: UILabel!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var activeButton: UIButton!
    

    private var activeAction: Action?
    private var cancelAction: Action?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewContainer.layer.cornerRadius = 20.0
        viewContainer.layer.masksToBounds = true
        
        activeButton.applyGradient(colours: [
            UIColor(red: 0.385, green: 0.192, blue: 0.796, alpha: 1),
            UIColor(red: 0.257, green: 0.184, blue: 0.833, alpha: 1)
          ], locations: [0.08, 1])
        
        activeButton.setCornerRadiusWith(radius: 6, borderWidth: 1, borderColor: .clear)
        
        cancelButton.setCornerRadiusWith(radius: 6, borderWidth: 2.0, borderColor: UIColor(red: 0.784, green: 0.784, blue: 0.784, alpha: 1))
    }

    // MARK: - IBAction Methods
    @discardableResult
    func load() -> CommonAlertVC {
        self.loadView()
        self.activeButton.did(.touchUpInside) { [weak self] _, _ in
            guard let `self` = self else { return }
            self.dismiss(animated: true, completion: self.activeAction)
        }
        
        self.cancelButton.did(.touchUpInside) { [weak self] _, _ in
            guard let `self` = self else { return }
            self.dismiss(animated: true, completion: self.cancelAction)
        }
        return self
    }
   
    @discardableResult
    func setTitle(_ title: String?) -> CommonAlertVC {
        self.titleLabel.text = title
        self.titleLabel.isHidden = (title?.isEmpty ?? true)
        return self
    }
    
    @discardableResult
    func setMessage(_ message: String?) -> CommonAlertVC {
        self.messageLabel.text = message
        self.messageLabel.isHidden = (message?.isEmpty ?? true)
        return self
    }
    
    @discardableResult
    func setWarning(_ message: String?) -> CommonAlertVC {
        self.warningDescription.text = message
        self.warningDescription.isHidden = (message?.isEmpty ?? true)
        return self
    }
    
    @discardableResult
    func setActiveButton(_ title: String?) -> CommonAlertVC {
        self.activeButton.setTitle(title, for: .normal)
        self.activeButton.isHidden = title?.isEmpty ?? true
        return self
    }
    
    @discardableResult
    func setActiveButton(_ action: Action?) -> CommonAlertVC {
        self.activeAction = action
        return self
    }
    
    @discardableResult
    func setCancelButton(_ title: String?) -> CommonAlertVC {
        self.cancelButton.setTitle(title, for: .normal)
        self.cancelButton.isHidden = title?.isEmpty ?? true
        return self
    }
    
    @discardableResult
    func setCancelButton(_ action: Action?) -> CommonAlertVC {
        self.cancelAction = action
        return self
    }

}
