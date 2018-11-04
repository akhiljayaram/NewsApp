//
//  NewsHelper.swift
//  NewsApp
//
//  Created by b2c on 11/4/18.
//  Copyright © 2018 b2c. All rights reserved.
//

import Foundation

class NewsHelper
{
    class func fetchAllNews(failure:@escaping APICompletionBlock,success:@escaping (_ message:String?,_ newsFeedItems:[NewsFeed]) -> Void){
        APIManager.fetchNews(params: nil, failure: failure){ (response) in
            let articles = response.response["articles"].arrayValue.map{NewsFeed.init(json: $0)}
//            let articleViewModels = articles.map{NewsFeedViewModel.init(feed: $0)}
            success(response.message, articles)
        }
        
    }
}
