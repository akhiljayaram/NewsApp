//
//  BaseAPIManager.swift
//  rider
//
//  Created by b2c on 2/12/18.
//  Copyright © 2018 ColdMagma. All rights reserved.
//

import Alamofire
import Reachability
import SwiftyJSON
typealias APICompletionBlock = (_ respone:APIResponse) -> Void

struct APIResponse
{
    var success = false
    var message = ""
    var response:JSON
    
    
    
}
class BaseAPIManager {
    
    // MARK: -
    // MARK: Main POST function
    
    
    class func createAPIResponse(_ success:Bool,_ message:String = "", _ response:JSON = JSON.null) -> APIResponse {
        return APIResponse.init(success: success, message: message, response: response)
    }
    class func createSuccessAPIResponse(_ message:String = "", _ response:JSON = JSON.null) -> APIResponse {
        return APIResponse.init(success: true, message: message, response: response)
    }
    class func createFailureAPIResponse(_ message:String = "", _ response:JSON = JSON.null) -> APIResponse {
        return  APIResponse.init(success: false, message: message, response: response)
    }
    
    class func make (method: HTTPMethod = .get, url:String!, parameters:Parameters?,needUserToken:Bool,failure:@escaping APICompletionBlock, success:@escaping APICompletionBlock)
    {
        
        
        
        //
        guard let connection = AppDelegate.appdelegate.reachability?.connection else
        {
            failure(createFailureAPIResponse("No Network Connection"))
            return
        }
        guard  connection != .none else {
            failure(createFailureAPIResponse("No Network Connection"))
            
            return
        }
        
        let queue = DispatchQueue(label: "com.coldmagma.news", qos: .utility, attributes: [.concurrent])
        
        
        let manager = Alamofire.SessionManager.default
     
        
        let authorization = "Bearer \(APIKey)"
        let headers: HTTPHeaders = [
            "Authorization": authorization,
            "Accept": "application/json",

        ]
//        let headers = [String:String]()
        Logger.logRequestParams(key: "request", url:url, header:headers, value: parameters ?? [:])
        
        let json = JSON.init(parameters as Any)
        Logger.logResponseParams(key: "requestP", value: json)
        
        
        manager.request(url, method: method, parameters: parameters, headers:headers).responseJSON( queue: queue, options: .allowFragments,completionHandler: { response in
            if let status = response.response?.statusCode {
                switch(status){
                case 200:
                    print("example success")
                    if let result = response.result.value {
                        let resultDictionary = result as! [String : Any]
                        let resultJSON = JSON(resultDictionary)
                         Logger.logResponseParams(key: "Response", value: resultDictionary)
                        let code = resultDictionary["status"] as! String
                        
                        if(code == "ok") {
                            let message = "Success"

                            
                            DispatchQueue.main.async {
                                success(createSuccessAPIResponse(message, resultJSON))
                                
                            }
                        }
                            
                       
                        else {
                            DispatchQueue.main.async {
                                let message = "Failed"

                                failure(createFailureAPIResponse(message))
                                
                            }
                        }
                        
                    }
                    
                default:
                    
                    DispatchQueue.main.async {
                        print("error with response status: \(status)")
                        failure(createFailureAPIResponse("Some Error Occured"))
                        
                    }
                }
            }
            else {
                DispatchQueue.main.async {
                    failure(createFailureAPIResponse("Some Error Occured"))
                }
            }
            //to get JSON return value
            
        })
        
        
        
    }
    
   
    
    
}
