//
//  EmotionService.swift
//  iMood
//
//  Created by Matt  North on 4/10/16.
//  Copyright © 2016 Matt  North. All rights reserved.
//

import UIKit

class EmotionService: IMWebService {
        
    init () {
        
        //we really shouldnt hard code this..
        let url: NSURL = NSURL(string: "https://api.projectoxford.ai/emotion/v1.0/")!
        super.init(url: url, key: "1a9db96e3aa64b0bb04e6fe787a19690")
    }
    
    func recognize (imageData: NSData, closure: webServiceClosure) {
        sendUploadRequest(imageData, methodString: "Recognize") { (error, response) in
            closure (error: error, response: response as! NSArray)
        }
        
    }

    
}
