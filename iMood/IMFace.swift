//
//  IMFace.swift
//  iMood
//
//  Created by Matt  North on 4/10/16.
//  Copyright © 2016 Matt  North. All rights reserved.
//

import UIKit

struct Emotion {
    var anger: Float = 0.0
    var contempt: Float = 0.0
    var disgust: Float = 0.0
    var fear: Float = 0.0
    var happiness: Float = 0.0
    var neutral: Float = 0.0
    var sadness: Float = 0.0
    var surprise: Float = 0.0
}

class IMFace {
    var emotion:Emotion?
    var faceImage: UIImage?
    var rawData: Data?
    var faceRectangle: CGRect?
    
    func buildEmotionFromDictionary(_ dicitonary: NSDictionary) -> Emotion {
        var emotionToBuild = Emotion()
        emotionToBuild.anger = (dicitonary["anger"] as? Float)!
        emotionToBuild.contempt = (dicitonary["contempt"] as? Float)!
        emotionToBuild.disgust = (dicitonary["disgust"] as? Float)!
        emotionToBuild.fear = (dicitonary["fear"] as? Float)!
        emotionToBuild.happiness = (dicitonary["happiness"] as? Float)!
        emotionToBuild.neutral = (dicitonary["neutral"] as? Float)!
        emotionToBuild.sadness = (dicitonary["sadness"] as? Float)!
        emotionToBuild.surprise = (dicitonary["surprise"] as? Float)!
        
        return emotionToBuild
    }
    
    func buildRectFromDictionary(_ dictionary: NSDictionary) -> CGRect {
        let x = (dictionary["left"] as AnyObject).floatValue
        let y = (dictionary["top"] as AnyObject).floatValue
        let width = (dictionary["width"] as AnyObject).floatValue
        let height = (dictionary["height"] as AnyObject).floatValue
        
        return CGRect(x: CGFloat(x!), y: CGFloat(y!), width: CGFloat(width!), height: CGFloat(height!));
    }

}
