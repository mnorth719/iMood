//
//  IMWebService.swift
//  iMood
//
//  Created by Matt  North on 4/10/16.
//  Copyright © 2016 Matt  North. All rights reserved.
//

import UIKit
import Alamofire

typealias webServiceClosure = (_ error: NSError?, _ response: AnyObject?) -> Void

enum WebServiceError: Error {
    case invalidRequest
    case requestTimedOut
    case unknownError
}

class IMWebService {
    
    let timeout: TimeInterval = 30
    init(url: URL, key: String) {
        baseURL = url
        APIKey = key
    }
    
    var baseURL: URL
    var APIKey: String
    
    
    //build a NSURLRequest, and pass along the data
    func sendUploadRequest(_ data: Data, methodString: String, completion: @escaping webServiceClosure) {
        //append our method name to the end of our base URL to form our full URL
        let requestURL = URL(string: baseURL.absoluteString.appending(methodString))
        
        var headers = [String : String]()
        headers["Ocp-Apim-Subscription-Key"] = APIKey
        headers["Content-Type"] = "application/octet-stream"
        
        upload(data, to: requestURL!, method: .post, headers: headers)
            .responseJSON { (response) in
                let JSON = response.result.value
                print("JSON: \(JSON)")
                completion(response.result.error as NSError?, JSON as AnyObject?)
        }
    
    }
}
