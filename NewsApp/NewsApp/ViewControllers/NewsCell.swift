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
//        publishedAtLabel.text = feed.title
        authorLabel.text = feed.author
        itemImageView.loadFromUrl(urlString: feed.imageUrl)
        itemImageView.clipsToBounds = true
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
