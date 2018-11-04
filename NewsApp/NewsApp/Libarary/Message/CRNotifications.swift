//
//  CRNotifications.swift
//  CRNotifications
//
//  Created by Casper Riboe on 21/03/2017.
//  LICENSE : MIT
//

import UIKit
import SnapKit
public class CRNotifications {
    
    public init(){}
    
    /// Shows a CRNotification
	public static func showNotification(type: CRNotificationType, title: String, message: String, dismissDelay: TimeInterval, completion: @escaping () -> () = {}) {
      
        
        let view = CRNotification()
        view.translatesAutoresizingMaskIntoConstraints = false
       
        view.setBackgroundColor(color: type.color)
        view.titleLabel.textColor = type.titleColor
        view.messageView.textColor = type.messageColor

        view.setImage(image: type.image)
        view.setTitle(title: title)
        view.setMessage(message: message)
        view.setDismisTimer(delay: dismissDelay)
		view.setCompletionBlock(completion)
        
        guard let window = UIApplication.shared.keyWindow else {
//            print("Failed to show CRNotification. No keywindow available.")
            return
        }
        
        window.addSubViewWithAnimation(subView: view.blureView)
        
        window.addSubview(view)
        view.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(16)
//            make.leading.equalToSuperview().offset(16)
//            make.trailing.equalToSuperview().offset(16)
//            make.left.equalToSuperview().offset(20)
//            make.right.equalToSuperview().offset(20)
            make.width.equalToSuperview().multipliedBy(0.85)
            make.centerX.equalToSuperview()


        }
        view.showNotification()
      
    }
}
