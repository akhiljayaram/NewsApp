//
//  NewsFeedViewModel.swift
//  NewsApp
//
//  Created by b2c on 11/5/18.
//  Copyright © 2018 b2c. All rights reserved.
//

import Foundation
struct NewsFeedViewModel {
    var title = ""
    var description = ""
    var author = ""
    var imageUrl = ""
//    var published:String
    
    init(feed:NewsFeed)
    {
        title = feed.title
        description = feed.description
        author = feed.author
        imageUrl = feed.imageUrl

    }
    
}
