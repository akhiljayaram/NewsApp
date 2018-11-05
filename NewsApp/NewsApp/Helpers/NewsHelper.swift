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
    static let newsFeedPerPage = 10
    static let q = "dubai"

    static func fetchAllNews(page:Int, failure:@escaping APICompletionBlock,success:@escaping (_ message:String?,_ newsFeedItems:[NewsFeed], _ totalAvailableResultCount:Int) -> Void){
       
        let params = ["page":page+1,"pageSize":newsFeedPerPage,"q":q] as [String : Any]
        APIManager.fetchNews(params: params, failure: failure){ (response) in
            let articles = response.response["articles"].arrayValue.map{NewsFeed.init(json: $0)}
//            let articleViewModels = articles.map{NewsFeedViewModel.init(feed: $0)}
            let totalAvailableResultCount = response.response["totalResults"].intValue
            success(response.message, articles, totalAvailableResultCount)
        }
        
    }
}
