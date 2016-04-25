//
//  UIViewController+KeyboardResize.swift
//  KeyboardResize
//
//  Created by Juan Alberto Uribe Otero on 4/22/16.
//  Copyright © 2016 Kogi Mobile. All rights reserved.
//

import UIKit

extension UIViewController {
    
    private struct AssociatedKeys {
        static var ResizeViewWhenKeyboardAppears = "kg_ResizeViewWhenKeyboardAppearsKey"
        static var OriginalFrame = "kg_OriginalFrameKey"
    }
    
    public var kg_resizeViewWhenKeyboardAppears: Bool {
        get {
            guard let resizeViewWhenKeyboardAppears = objc_getAssociatedObject(
                self,
                &AssociatedKeys.ResizeViewWhenKeyboardAppears) as? Bool else {
                    return false
            }
            return resizeViewWhenKeyboardAppears
        }
        set {
            objc_setAssociatedObject(
                self,
                &AssociatedKeys.ResizeViewWhenKeyboardAppears,
                newValue,
                .OBJC_ASSOCIATION_ASSIGN)
        }
    }
    
    private var originalFrame: CGRect {
        get {
            guard let frameString = objc_getAssociatedObject(
                self,
                &AssociatedKeys.OriginalFrame) as? String else {
                    return CGRectZero
            }
            return CGRectFromString(frameString)
        }
        set {
            let frameString = NSStringFromCGRect(newValue) as String
            objc_setAssociatedObject(
                self,
                &AssociatedKeys.OriginalFrame,
                frameString,
                objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func viewWillAppearResizeKeyboard(animated: Bool) {
        viewWillAppearResizeKeyboard(animated)
        
        if kg_resizeViewWhenKeyboardAppears {
            NSNotificationCenter.defaultCenter().addObserver(
                self,
                selector: #selector(keyboardWillShow(_:)),
                name: UIKeyboardWillShowNotification,
                object: nil)
            
            NSNotificationCenter.defaultCenter().addObserver(
                self,
                selector: #selector(keyboardWillHide(_:)),
                name: UIKeyboardWillHideNotification,
                object: nil)
        }
    }
    
    func viewWillDisappearResizeKeyboard(animated: Bool) {
        viewWillDisappearResizeKeyboard(animated)
        
        NSNotificationCenter.defaultCenter().removeObserver(
            self,
            name: UIKeyboardWillShowNotification,
            object: nil)
        
        NSNotificationCenter.defaultCenter().removeObserver(
            self,
            name: UIKeyboardWillHideNotification,
            object: nil)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        // TODO: Implement view resize
        print("KeyboardWillShow")
    }
    
    func keyboardWillHide(notification: NSNotification) {
        // TODO: Implement view resize
        print("KeyboardWillHide")
    }
    
    public override class func initialize() {
        struct Static {
            static var token: dispatch_once_t = 0
        }
        
        // make sure this isn't a subclass
        if self !== UIViewController.self {
            return
        }
        
        dispatch_once(&Static.token) {
            
            func swizzleSelectors(originalSelector originalSelector: Selector, swizzledSelector: Selector) {
                let originalMethod = class_getInstanceMethod(self, originalSelector)
                let swizzledMethod = class_getInstanceMethod(self, swizzledSelector)
                
                let didAddMethod = class_addMethod(self, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))
                
                if didAddMethod {
                    class_replaceMethod(self, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
                } else {
                    method_exchangeImplementations(originalMethod, swizzledMethod)
                }
            }
            
            swizzleSelectors(originalSelector: #selector(viewWillAppear(_:)), swizzledSelector: #selector(viewWillAppearResizeKeyboard(_:)))
            swizzleSelectors(originalSelector: #selector(viewWillDisappear(_:)), swizzledSelector: #selector(viewWillDisappearResizeKeyboard(_:)))
        }
    }
}
