//
//  UIView+Extension.swift
//  NewsApp
//
//  Created by b2c on 11/4/18.
//  Copyright © 2018 b2c. All rights reserved.
//

import UIKit

extension UIView
{
    func addSubViewWithAnimation(subView: UIView) {
        subView.alpha = 0
        self.addSubview(subView)
        subView.frame = self.bounds
        UIView.animate(withDuration: 0.4) {
            subView.alpha = 1
        }
    }
    
    func removeSubViewWithAnimation(subView: UIView) {
        UIView.animate(withDuration: 0.4, animations: {
            subView.alpha = 0
        }) { (success) in
            if success {
                subView.removeFromSuperview()
            }
        }
    }
    @IBInspectable public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.masksToBounds = true
            layer.cornerRadius = abs(CGFloat(Int(newValue * 100)) / 100)
        }
    }
}
