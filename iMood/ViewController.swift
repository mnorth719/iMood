//
//  ViewController.swift
//  iMood
//
//  Created by Matt  North on 4/10/16.
//  Copyright © 2016 Matt  North. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var faceImage:IMMoodImage = IMMoodImage()
    var faces:[IMFace]?
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
        faceImage.image = image
        noPhotoSelectedLabel.hidden = true
        selectedImage.contentMode = .ScaleAspectFit
        selectedImage.image = image
        faceImage.rawImageData = UIImageJPEGRepresentation(image, 0.0)
        
        picker .dismissViewControllerAnimated(true, completion: nil)
        
        //make call to MS
        // Mock this for now
        faceImage.determineEmotion { [unowned self] (error, faceArray) -> Void in
            
            self.faces = faceArray
            //Bind this to ViewModel some how. 
            self .performSegueWithIdentifier("imageDetailControllerSegue", sender: self)
        }
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true) { () -> Void in
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "imageDetailControllerSegue") {
            let destination: IMFaceDetailsController = segue.destinationViewController as! IMFaceDetailsController
            destination.faces = self.faces
        }
    }

}

