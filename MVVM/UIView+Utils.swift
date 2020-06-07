//
//  UIView+Utils.swift
//  Kishan Suthar
//
//  Created by mac on 7/06/20.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func addAndFitSubview(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        let views = ["view": view]
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|", options: [], metrics: nil, views: views))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|", options: [], metrics: nil, views: views))
    }
    
    func roundedUsingWidth() {
        self.rounded(cornerRadius: self.frame.size.width/2)
    }
    
    func roundedUsingHeight() {
        self.layoutIfNeeded()
        self.rounded(cornerRadius: self.frame.size.height/2)
    }
    
    func rounded(cornerRadius: CGFloat) {
        self.layoutIfNeeded()
        self.layer.cornerRadius = cornerRadius
        //        self.layer.masksToBounds = true
    }
    
    func applyShadow(
        apply: Bool,
        color: UIColor = UIColor.black,
        offset: CGSize = CGSize(width: 0.0, height: 2.0),
        opacity: Float = 0.2, radius: Float = 1.0,
        shadowRect: CGRect? = nil) {
        self.layer.shadowColor = apply ? color.cgColor : UIColor.white.withAlphaComponent(0.0).cgColor
        self.layer.shadowOffset = apply ? offset : CGSize(width: 0.0, height: 0.0)
        self.layer.shadowOpacity = apply ? opacity : 0.0
        self.layer.shadowRadius = apply ? CGFloat(radius) : 0.0
        self.layer.masksToBounds = false
        if let shadowRect = shadowRect {
            self.layer.shadowPath = UIBezierPath(rect: shadowRect).cgPath
        }
    }
    
    func applyGlow(apply: Bool, color: UIColor) {
        self.layer.shadowColor = apply ? color.cgColor : UIColor.white.withAlphaComponent(0.0).cgColor
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowOpacity = apply ? 0.4 : 0.0
        self.layer.shadowRadius = apply ? 10.0 : 0.0
        self.layer.masksToBounds = false
    }
    
    var nibName: String {
        return type(of: self).description().components(separatedBy: ".").last! // to remove the module name and get only files name
    }
    
    func loadNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: self.nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil)[0] as! UIView
    }
    // MARK: IBInspectable
    
    @IBInspectable var borderColor: UIColor {
        get {
            let color = self.layer.borderColor ?? UIColor.white.cgColor
            return UIColor(cgColor: color) // not using this property as such
        }
        set {
            self.layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var roundCorner: Bool {
        get {
            return false
        }
        set {
            if newValue {
                
                self.roundedUsingHeight()
            }
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.cornerRadius
        }
        set {
            if !roundCorner {
                self.layer.cornerRadius = newValue
                self.rounded(cornerRadius: newValue)
            }
        }
    }
    
    @IBInspectable var shadowColor: UIColor {
        get {
            let color = self.layer.shadowColor ?? UIColor.white.cgColor
            return UIColor(cgColor: color) // not using this property as such
        }
        set {
            self.layer.shadowColor = newValue.cgColor
            self.layer.masksToBounds = false
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        get {
            return self.layer.shadowOpacity
        }
        set {
            self.layer.shadowOpacity = newValue
            self.layer.masksToBounds = true
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        get {
            return self.layer.shadowRadius
        }
        set {
            self.layer.shadowRadius = newValue
            self.layer.masksToBounds = false
        }
    }
    
    @IBInspectable var shadowOffset: CGSize {
        get {
            return self.layer.shadowOffset
        }
        set {
            self.layer.shadowOffset = newValue
            self.layer.masksToBounds = false
        }
    }
    
    @IBInspectable var addPulseEffect: Bool {
        get {
            return false
        }
        set {
            if newValue {
                let pulseAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
                pulseAnimation.duration = 1
                pulseAnimation.fromValue = 0
                pulseAnimation.toValue = 1
                pulseAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
                pulseAnimation.autoreverses = true
                pulseAnimation.repeatCount = .greatestFiniteMagnitude
                self.layer.add(pulseAnimation, forKey: "animateOpacity")
            }
        }
    }
    
    @IBInspectable var applyGradiant: Bool {
        get {
            return false
        }
        set {
            if newValue {
                self.layer.shadowColor = UIColor.black.cgColor
                self.layer.shadowOpacity = 0.3
                self.layer.shadowRadius = 5
                self.layer.shadowOffset = CGSize(width: 0, height: -3)
                self.layer.masksToBounds = false
            }
        }
    }
    
    @IBInspectable var setTopCornerRadious: CGFloat {
        get {
            return 0
        }
        
        set {
            if newValue > 0 {
                self.setNeedsFocusUpdate()
                let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: newValue, height: newValue))
                let maskLayer = CAShapeLayer()
                maskLayer.frame = self.bounds
                maskLayer.path = path.cgPath
                self.layer.mask = maskLayer
                self.layoutIfNeeded()
            }
        }
    }
        
    open func setRoundCorners(corners: UIRectCorner, cornerRadious: CGFloat) {
        self.layoutIfNeeded()
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadious, height: cornerRadious))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
    }
}




extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension UIViewController {
    
    func setStatusBackgroundColor(mColor: UIColor) {
        
        if #available(iOS 13.0, *) {
            let app = UIApplication.shared
            let statusBarHeight: CGFloat = app.statusBarFrame.size.height

            let statusbarView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: statusBarHeight))
            statusbarView.backgroundColor = mColor
            view.addSubview(statusbarView)
        } else {
            let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView
            statusBar?.backgroundColor = mColor
        }
    }
}
