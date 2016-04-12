//
//  ViewController.swift
//  iMood
//
//  Created by Matt  North on 4/10/16.
//  Copyright © 2016 Matt  North. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var emotionFace:IMFace = IMFace()
    @IBOutlet weak var selectedImage: UIImageView!
    @IBOutlet weak var noPhotoSelectedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cameraButtonPushed(sender: AnyObject) {
        let imageSourceController: IMImageSourceAlertController = IMImageSourceAlertController(title: "Choose option:", message: nil, preferredStyle: .ActionSheet)
        let senderView = sender as! UIView
        imageSourceController.show(self, animated: true, inView: senderView.superview, fromRect: senderView.frame)
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        emotionFace.faceImage = image
        noPhotoSelectedLabel.hidden = true
        selectedImage.contentMode = .ScaleAspectFit
        selectedImage.image = image
        
        //make call to MS
//        emotionFace.determineEmotion { (error, response) -> Void in
//            
//        }
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true) { () -> Void in
        }
    }

}

