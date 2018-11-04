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
    class func fetchAllNews(failure:@escaping APICompletionBlock,success:@escaping (_ message:String?) -> Void){
        let params = [String:Any]()
        APIManager.fetchNews(params: params, failure: failure){ (response) in
            success(response.message)
        }
        
    }
}
