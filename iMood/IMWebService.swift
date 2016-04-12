//
//  IMWebService.swift
//  iMood
//
//  Created by Matt  North on 4/10/16.
//  Copyright © 2016 Matt  North. All rights reserved.
//

import UIKit

typealias webServiceClosure = (error: String, response: AnyObject) -> Void

class IMWebService {
    
    init(url: NSURL, key: String) {
        baseURL = url
        APIKey = key
    }
    
    var baseURL: NSURL
    var APIKey: String
    
    func sendRequest(params: NSDictionary, method: String, completion: webServiceClosure) {
        
    }
    
}
