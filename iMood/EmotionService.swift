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
        let url: NSURL = NSURL(string: "https://api.projectoxford.ai/emotion/v1.0/")!
        super.init(url: url, key: "18485643de4642338bd4402ca625a5e3")
    }
    
    func recognize (imageData: NSData) {
        sendRequest(imageData, method: "recognize") { (error, response) -> Void in
            
        }
    }
    
    func sendRequest(dataToSend: NSData, method: String, completion: webServiceClosure) {
        
    }
    
}
