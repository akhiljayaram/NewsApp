//
//  CRNotification.swift
//  CRNotifications
//
//  Created by Casper Riboe on 21/03/2017.
//  LICENSE : MIT
//

import UIKit
import SnapKit

class CRNotification: UIView {

	public fileprivate(set) lazy var imageView: UIImageView = {
		let view = UIImageView()
		return view
	}()
    public fileprivate(set) lazy var headerView: UIView = {
        let view = UIView()
//        view.backgroundColor = .red
        return view
    }()
	public fileprivate(set) lazy var titleLabel: AppLabel = {
		let label = AppLabel()
        label.font = UIFont(name: UIFont.AppFont.medium, size: 22)
        return label
	}()
	public fileprivate(set) lazy var messageView: AppLabel = {
		let view = AppLabel()
		view.font = UIFont(name: UIFont.AppFont.regular, size: 16)
		view.backgroundColor = .clear
		view.textColor = UIColor.AppColor.darkGray
		view.isUserInteractionEnabled = false
        
        view.textAlignment = .center
        view.numberOfLines = 0
		return view
	}()
	public var completion: () -> () = {}
    
    public fileprivate(set) lazy var blureView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
//        view.isUserInteractionEnabled = false
        return view
    }()
    
	
	init() {
		
//        super.init(frame: CGRect(x: 0, y: -height, width: width, height: height))
//        center.x = UIScreen.main.bounds.width/2
        super.init(frame:.zero)
//        center.x = UIScreen.main.bounds.width/2

		cornerRadius = 8
//        setupLayer()
		setupSubviews()
		setupConstraints()
		setupTargets()
	}
	
//    func setupLayer() {
//        layer.shadowRadius = 5
//        layer.shadowOpacity = 0.25
//        layer.shadowColor = UIColor.lightGray.cgColor
//    }
	
	func setupSubviews() {
		addSubview(messageView)
        addSubview(headerView)
	
        self.headerView.addSubview(imageView)
        self.headerView.addSubview(titleLabel)
        imageView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
            make.width.equalTo(20)
            make.height.equalTo(20)
            make.bottom.equalToSuperview()

        }
        titleLabel.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview()
            make.leading.equalTo(imageView.snp.trailing).offset(8)
            make.centerY.equalToSuperview()

        }
    }
	
	func setupConstraints() {
		imageView.translatesAutoresizingMaskIntoConstraints = false
		messageView.translatesAutoresizingMaskIntoConstraints = false
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
        headerView.translatesAutoresizingMaskIntoConstraints = false
		
      
     
       
        headerView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(16)
            make.centerX.equalToSuperview()

        }
        messageView.snp.makeConstraints { (make) in
            make.top.equalTo(headerView.snp.bottom).offset(20)
            make.bottom.equalToSuperview().inset(16)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()

        }
//        NSLayoutConstraint.activate([
//            headerView.topAnchor.constraint(equalTo: headerView.superview!.topAnchor, constant: 14),
//            headerView.centerXAnchor.constraint(equalTo: headerView.superview!.centerXAnchor, constant: 0.9),
//            ])
//
//        NSLayoutConstraint.activate([
//            imageView.heightAnchor.constraint(equalTo: imageView.heightAnchor),
//            imageView.widthAnchor.constraint(equalTo: imageView.widthAnchor),
//            imageView.leadingAnchor.constraint(equalTo: (imageView.superview?.leadingAnchor)!, constant: 0),
//            imageView.topAnchor.constraint(equalTo: (imageView.superview?.topAnchor)!, constant: 0),
////            imageView.bottomAnchor.constraint(equalTo: (imageView.superview?.bottomAnchor)!, constant: 0)
//            ])
//
//        NSLayoutConstraint.activate([
//            titleLabel.centerYAnchor.constraint(equalTo: (titleLabel.superview?.centerYAnchor)!, constant: 0),
//            titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
//            titleLabel.trailingAnchor.constraint(equalTo: (titleLabel.superview?.trailingAnchor)!, constant: 0)
//            ])
//
//
//        NSLayoutConstraint.activate([
//            messageView.centerXAnchor.constraint(equalTo: messageView.superview!.centerXAnchor, constant: 0),
//            messageView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 8),
//            messageView.bottomAnchor.constraint(equalTo: messageView.superview!.bottomAnchor, constant: 0),
//            messageView.leadingAnchor.constraint(equalTo: messageView.superview!.leadingAnchor, constant: 8),
//            messageView.trailingAnchor.constraint(equalTo: messageView.superview!.trailingAnchor, constant: -8)
//            ])
	}
	
	func setupTargets() {
		let dismissRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissNotification))
		addGestureRecognizer(dismissRecognizer)
	}
	
	@objc func didRotate() {
//        UIView.animate(withDuration: 0.2) {
//            self.center.x = UIScreen.main.bounds.width/2
//            self.center.y = UIApplication.shared.statusBarFrame.height + 10 + self.frame.height/2
//        }
	}
	
	/// Required init for nib loading (nib loading is not supported)
	required public init?(coder aDecoder:NSCoder) { fatalError("Not implemented.") }
	
	/// Sets the background color of the notification
	func setBackgroundColor(color: UIColor) {
		backgroundColor = color
	}
	
	/// Sets the title of the notification
	func setTitle(title: String) {
		titleLabel.text = title
	}
	
	/// Sets the message of the notification
	func setMessage(message: String) {
		messageView.text = message
	}
	
	/// Sets the image of the notification
	func setImage(image: UIImage) {
		imageView.image = image
	}
	
	/// Sets the completion block of the notification for when it is dismissed
	func setCompletionBlock(_ completion: @escaping () -> ()) {
		self.completion = completion
	}
	
	/// Dismisses the notification with a delay > 0
	func setDismisTimer(delay: TimeInterval) {
		if delay > 0 {
            Timer.scheduledTimer(timeInterval: Double(delay), target: self, selector: #selector(dismissNotification), userInfo: nil, repeats: false)
		}
	}
	
	/// Animates in the notification
	func showNotification() {
        UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.68, initialSpringVelocity: 0.1, options: UIView.AnimationOptions(), animations: {
			self.frame.origin.y = UIApplication.shared.statusBarFrame.height + 10
		})
	}
	
	/// Animates out the notification
	@objc func dismissNotification() {
        UIView.animate(withDuration: 0.1, delay: 0.0, options: UIView.AnimationOptions(), animations: {
			self.frame.origin.y = self.frame.origin.y + 5
		}, completion: {
			(complete: Bool) in
            UIView.animate(withDuration: 0.25, delay: 0.0, options: UIView.AnimationOptions(), animations: {
				self.center.y = -self.frame.height
			}, completion: { (complete) in
				self.completion()
                self.blureView.removeFromSuperview()
                self.removeFromSuperview()
            })
		})
	}
}


