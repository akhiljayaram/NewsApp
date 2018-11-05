//
//  NewsCell.swift
//  NewsApp
//
//  Created by b2c on 11/5/18.
//  Copyright © 2018 b2c. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {

    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var descLabel:UILabel!
    @IBOutlet weak var publishedAtLabel:UILabel!
    @IBOutlet weak var authorLabel:UILabel!
    @IBOutlet weak var itemImageView:UIImageView!
    @IBOutlet weak var itemImageContainer:UIView!

    var gradientLayer =  CAGradientLayer()
    var feed:NewsFeed?
    {
        didSet
        {
            setValues()
        }
    }

    func setValues()
    {
        guard let feed = self.feed else
        {
            return
        }
        titleLabel.text = feed.title
        descLabel.text = feed.description
        publishedAtLabel.text = feed.displayDateString
        authorLabel.text = feed.author
        itemImageView.loadFromUrl(urlString: feed.imageUrl)
        itemImageContainer.isHidden = feed.imageUrl.isEmpty
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        addGradient()
        // Initialization code
    }
    func addGradient()
    {
        
        gradientLayer.frame = itemImageContainer.bounds
        gradientLayer.colors = [ UIColor.clear.cgColor,UIColor.clear.cgColor, UIColor.black.withAlphaComponent(0.7).cgColor]
        gradientLayer.locations = [0.0, 0.8, 1.0]

        itemImageView.layer.insertSublayer(gradientLayer, at: 1)

    }
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = itemImageContainer.bounds

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
