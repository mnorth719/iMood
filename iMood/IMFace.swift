//
//  IMFace.swift
//  iMood
//
//  Created by Matt  North on 4/10/16.
//  Copyright © 2016 Matt  North. All rights reserved.
//

import UIKit

struct Emotion {
    var anger = 0
    var contempt = 0
    var disgust = 0
    var fear = 0
    var happiness = 0
    var neutral = 0
    var sadness = 0
    var surprise = 0
}

class IMFace: NSObject {
    var emotion = Emotion()
    var faceImage: UIImage?
    var rawData: NSData?
    
    func determineEmotion (closure: webServiceClosure) {
        let emotionService: EmotionService = EmotionService()
        emotionService.recognize(rawData!)
        
        
    }

}
