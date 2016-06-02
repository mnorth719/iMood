//
//  IMWebService.swift
//  iMood
//
//  Created by Matt  North on 4/10/16.
//  Copyright © 2016 Matt  North. All rights reserved.
//

import UIKit
import Alamofire

typealias webServiceClosure = (error: NSError?, response: AnyObject?) -> Void

enum WebServiceError: ErrorType {
    case InvalidRequest
    case RequestTimedOut
    case UnknownError
}

class IMWebService {
    
    let timeout: NSTimeInterval = 30
    init(url: NSURL, key: String) {
        baseURL = url
        APIKey = key
    }
    
    var baseURL: NSURL
    var APIKey: String
    
    
    //build a NSURLRequest, and pass along the data
    func sendUploadRequest(data: NSData, methodString: String, completion: webServiceClosure) {
        //append our method name to the end of our base URL to form our full URL
        let requestURL = NSURL(string: baseURL.absoluteString.stringByAppendingString(methodString))
        
        var headers = [String : String]()
        headers["Ocp-Apim-Subscription-Key"] = APIKey
        headers["Content-Type"] = "application/octet-stream"
    
    
        upload(.POST, requestURL!, headers: headers, data: data)
            .responseJSON { (response) in
                let JSON = response.result.value
                print("JSON: \(JSON)")
                completion(error: response.result.error, response: JSON)
        }
    
    }
    
    func sendRequest(parameters: NSDictionary, method: String, completion: webServiceClosure) {
        
    }
    
}
