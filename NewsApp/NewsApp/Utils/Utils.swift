//
//  Utils.swift
//  NewsApp
//
//  Created by b2c on 11/4/18.
//  Copyright © 2018 b2c. All rights reserved.
//

import Foundation
class Utils {
    
    class func getJsonText(parameters:[String:Any]) -> String
    {
        var  theJSONText = ""
        if let theJSONData = try? JSONSerialization.data(
            withJSONObject: parameters,
            options: []) {
            theJSONText = String(data: theJSONData,
                                 encoding: .ascii) ?? ""
        }
        return theJSONText
    }
   
   
    
}
