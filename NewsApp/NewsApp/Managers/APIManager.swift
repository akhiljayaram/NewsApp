//
//  APIManager.swift
//  NewsApp
//
//  Created by b2c on 11/4/18.
//  Copyright © 2018 b2c. All rights reserved.
//

import Foundation
import Alamofire

class APIManager {

static func fetchNews(params:Parameters?, failure:@escaping APICompletionBlock, success:@escaping APICompletionBlock)
{
    let url:String = baseAPIUrl+"/everything?q=dubai"
    
    BaseAPIManager.make(url:url, parameters: params, needUserToken: false, failure: failure,  success: success)
    
}
}

