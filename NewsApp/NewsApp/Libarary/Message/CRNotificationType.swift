//
//  CRNotificationType.swift
//  CRNotifications
//
//  Created by Casper Riboe on 14/09/2017.
//	LICENSE : MIT
//

import Foundation
import UIKit

/// Enum for types of notifications
public enum CRNotificationType {
	case success
	case error
	
	var color: UIColor {
		switch self {
		case .success: return UIColor.white
		case .error: return UIColor.orange
		}
	}
    var titleColor: UIColor {
        switch self {
        case .success: return UIColor.green
        case .error: return UIColor.white
        }
    }
    var messageColor: UIColor {
        switch self {
        case .success: return UIColor.blue
        case .error: return UIColor.white
        }
    }
	var image: UIImage {
		let bundle = Bundle(for: CRNotifications.self)
		
		switch self {
        case .success: return UIImage(named: "message_tick_green", in: bundle, compatibleWith: nil)!
        case .error: return UIImage(named: "message_warning_white", in: bundle, compatibleWith: nil)!
		}
	}
}
