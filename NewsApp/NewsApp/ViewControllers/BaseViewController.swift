//
//  BaseViewController.swift
//  NewsApp
//
//  Created by b2c on 11/4/18.
//  Copyright © 2018 b2c. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        customizeNavigationBar()

    }

    func customizeNavigationBar() {
        navigationItem.titleView = navigationTitleView()
        navigationItem.hidesBackButton = false
        let backImage = UIImage(named:"back")?.withRenderingMode(.alwaysOriginal)
        navigationItem.backBarButtonItem?.title = ""
        navigationController?.navigationBar.backIndicatorImage = backImage;
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage;
        navigationController?.navigationBar.topItem?.title = " "
        
    }
    func navigationTitleView() -> UIView {
        
        let label = AppLabel.init(frame: .zero)
        label.textAlignment = .center
        label.textColor = .white
        label.text = self.title
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        return label
    }


}
