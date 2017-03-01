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
    
    @IBAction func cameraButtonPushed(_ sender: AnyObject) {
        let imageSourceController: IMImageSourceAlertController = IMImageSourceAlertController(title: "Choose option:", message: nil, preferredStyle: .actionSheet)
        let senderView = sender as! UIView
        imageSourceController.show(self, animated: true, inView: senderView.superview, fromRect: senderView.frame)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        faceImage.image = image
        noPhotoSelectedLabel.isHidden = true
        selectedImage.contentMode = .scaleAspectFit
        selectedImage.image = image
        faceImage.rawImageData = UIImageJPEGRepresentation(image, 0.0)
        
        picker .dismiss(animated: true, completion: nil)
        
        //make call to MS
        // Mock this for now
        faceImage.determineEmotion { [unowned self] (error, faceArray) -> Void in
            
            self.faces = faceArray
            //Bind this to ViewModel some how. 
            self .performSegue(withIdentifier: "imageDetailControllerSegue", sender: self)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true) { () -> Void in
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "imageDetailControllerSegue") {
            let destination: IMFaceDetailsController = segue.destination as! IMFaceDetailsController
            destination.faces = self.faces
        }
    }

}

