//
//  UIControlExtension.swift
//  DemoAlert
//
//  Created by Thanh Than Van on 09/08/2022.
//

import UIKit

extension UIControl.Event: Hashable {
    public func hash(into hasher: inout Hasher) {
        var key = ""
        switch self {
        case .touchUpInside:
            key = "touchUpInside"
            
        case .editingChanged:
            key = "editingChanged"
            
        case .editingDidEnd:
            key = "editingDidEnd"
            
        case .editingDidEndOnExit:
            key = "editingDidEndOnExit"
            
        case .editingDidBegin:
            key = "editingDidBegin"
            
        case .valueChanged:
            key = "valueChanged"
            
        default:
            assertionFailure("did not support \(self) yet")
        }
        hasher.combine(key)
    }
}

private var kControlHandlers: UInt8 = 0
extension UIControl {
    typealias ControlHandler = ((UIControl, Any?) -> Void)
    
    var controlHandlers: [UIControl.Event: ControlHandler] {
        get {
            var handlers = objc_getAssociatedObject(self, &kControlHandlers) as? [UIControl.Event: ControlHandler]
            if handlers == nil {
                handlers = [:]
                self.controlHandlers = handlers!
            }
            return handlers!
        }
        set {
            objc_setAssociatedObject(self, &kControlHandlers, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func selector(for event: UIControl.Event) -> Selector {
        var sel: Selector!
        switch event {
        case .touchUpInside:
            sel = #selector(did_touchUpInside(_:))
            
        case .editingDidEnd:
            sel = #selector(did_endEditing(_:))
            
        case .editingChanged:
            sel = #selector(did_changed(_:))
            
        case .editingDidBegin:
            sel = #selector(did_beginEditing(_:))
            
        case .editingDidEndOnExit:
            sel = #selector(did_endOnExitEditing(_:))
            
        case .valueChanged:
            sel = #selector(did_changeValue(_:))
            
        default:
            assertionFailure("UIControl did not support \(event) yet")
        }
        return sel
    }
    
    func did(_ event: UIControl.Event, handler: @escaping ControlHandler) {
        controlHandlers[event] = handler
        addTarget(self, action: selector(for: event), for: event)
    }
    
    @objc
    func fire(event: UIControl.Event, value: Any?) {
        controlHandlers[event]?(self, value)
    }
    
    @objc
    func did_beginEditing(_ sender: Any) {
        fire(event: .editingDidBegin, value: nil)
    }
    
    @objc
    func did_changed(_ sender: Any) {
        fire(event: .editingChanged, value: nil)
    }
    
    @objc
    func did_endEditing(_ sender: Any) {
        fire(event: .editingDidEnd, value: nil)
    }
    
    @objc
    func did_endOnExitEditing(_ sender: Any) {
        fire(event: .editingDidEndOnExit, value: nil)
    }
    
    @objc
    func did_changeValue(_ sender: Any) {
        switch sender {
        case let sw as UISwitch:
            fire(event: .valueChanged, value: sw.isOn)
            
        case let sl as UISlider:
            fire(event: .valueChanged, value: sl.value)
            
        default:
            fire(event: .valueChanged, value: nil)
        }
    }
    
    @objc
    func did_touchUpInside(_ sender: Any) {
        fire(event: .touchUpInside, value: nil)
    }
}
