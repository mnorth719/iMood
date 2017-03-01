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
        let url: URL = URL(string: "https://api.projectoxford.ai/emotion/v1.0/")!
        super.init(url: url, key: "1a9db96e3aa64b0bb04e6fe787a19690")
    }
    
    func recognize (_ imageData: Data, closure: @escaping webServiceClosure) {
        sendUploadRequest(imageData, methodString: "Recognize") { (error, response) in
            closure (error, response as! NSArray)
        }
        
    }

    
}
