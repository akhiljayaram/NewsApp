//
//  NewsIFeed.swift
//  NewsApp
//
//  Created by b2c on 11/5/18.
//  Copyright © 2018 b2c. All rights reserved.
//

import Foundation
import SwiftyJSON
struct NewsFeed {
    var title = ""
    var description = ""
    var author = ""
    var url = ""
    var content = ""
    var imageUrl = ""
    var publishedAt = ""

    var publishedDate:Date?
    
    init(json:JSON)
    {
        title = json["title"].stringValue
        description = json["description"].stringValue
        author = json["author"].stringValue
        url = json["url"].stringValue
        content = json["content"].stringValue
        imageUrl = json["imageUrl"].stringValue
        publishedAt = json["imageUrl"].stringValue


    }

}
