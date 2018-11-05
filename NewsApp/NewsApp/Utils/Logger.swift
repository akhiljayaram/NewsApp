//
//  Utils.swift
//  NewsApp
//
//  Created by b2c on 11/4/18.
//  Copyright © 2018 b2c. All rights reserved.
//

import Foundation
import SwiftyJSON

class Logger {
    
   
    
    static func log(key:String,value:Any)
    {
        //        print("\(key):\(value)")
    }
    
    static func logString(key:String, value:String)
    {
        //    NSLog("%@:%@", key,value)
    }
    
    static func logRequestParams(key:String, value:[String:Any])
    {
        
        //           NSLog("%@:%@", key,Utils.getJsonText(parameters: value))
    }
    static func logResponseParams(key:String, value:[String:Any])
    {
//        logResponseParams(key: key, value: JSON(value))
        
        //           NSLog("%@:%@", key,Utils.getJsonText(parameters: value))
    }
    
    static func logRequestParams(key:String,url:String,header:[String:Any], value:[String:Any])
    {
        let  string = NSString.init(format: "%@: %@ %@ %@", key,url,Utils.getJsonText(parameters: header), Utils.getJsonText(parameters: value))
        //        NSLog("%@: %@ %@ %@", key,url,Utils.getJsonText(parameters: header), Utils.getJsonText(parameters: value))
//                   print(string)
    }
    static func logResponseParams(key:String, value:JSON)
    {
        let  string = NSString.init(format: "%@:%@", key,(value.rawString() ?? ""))
        
        //        NSLog("%@:%@", key,Utils.getJsonText(parameters: value))
//                   print(string)
        
    }
    
}
