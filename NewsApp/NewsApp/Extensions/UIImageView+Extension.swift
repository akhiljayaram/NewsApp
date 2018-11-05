//
//  UIImageView+Extension.swift
//  NewsApp
//
//  Created by b2c on 11/5/18.
//  Copyright © 2018 b2c. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView
{
    
    func loadFromUrl(urlString:String?, placeholder:Placeholder? = nil)
    {
        
        if (urlString == nil)
        {
            return
        }
        let urStr = urlString?.replacingOccurrences(of: "|", with: "%7c")
        
        let url = URL(string: urStr!)
        
        self.kf.setImage(with: url, placeholder: placeholder)
        
        
        
    }
    func loadNewsFromUrl(urlString:String?, placeholder:Placeholder? = UIImage.init(named: "placeholder"))
    {
        
        self.backgroundColor = .clear
        loadFromUrl(urlString: urlString, placeholder: placeholder)
        
        
        
    }
}
