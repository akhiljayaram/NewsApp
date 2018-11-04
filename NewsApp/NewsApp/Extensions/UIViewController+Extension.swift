//
//  UIViewController+Extension.swift
//  NewsApp
//
//  Created by b2c on 11/4/18.
//  Copyright © 2018 b2c. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

extension UIViewController
{
    func failureBlock() -> APICompletionBlock
    {
        return { (response) in
            
            self.stopActivityIndicator()
            self.showErrorMessage(message: response.message)
        }
    }
    func showErrorMessage(message : String?) {
        
        CRNotifications.showNotification(type: .error, title: "Oops!", message: message ?? "", dismissDelay: 1)
    }
    func showSuccessMessage(message : String?) {
        
        CRNotifications.showNotification(type: .success, title: "Success!", message: message ?? "", dismissDelay: 1)
    }
    func startActivityIndicator() {
        
        DispatchQueue.main.async {
           
            NVActivityIndicatorView.DEFAULT_TYPE = .lineScalePulseOut
            NVActivityIndicatorView.DEFAULT_COLOR = UIColor.white
            NVActivityIndicatorView.DEFAULT_PADDING = 10
            
            let activityData = ActivityData()
            
            NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData,nil)
            
        }
        
        
    }
    func stopActivityIndicator() {
        
        DispatchQueue.main.async {
           
            NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
        }
    }
}
