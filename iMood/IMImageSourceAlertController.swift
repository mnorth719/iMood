//
//  IMImageSourceAlertController.swift
//  iMood
//
//  Created by Matt  North on 4/12/16.
//  Copyright © 2016 Matt  North. All rights reserved.
//

import UIKit

typealias imageSourceControllerProtocol = protocol<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

class IMImageSourceAlertController: UIAlertController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func show<T:UIViewController where T: imageSourceControllerProtocol> (presentingController: T, animated: Bool, inView: UIView?, fromRect: CGRect?) {
        switch UIDevice.currentDevice().userInterfaceIdiom {
        case .Phone:
            // It's an iPhone
            showForPhone(presentingController, animated: animated)
            break;
        case .Pad:
            // It's an iPad
            showForiPad(presentingController, fromRect: fromRect!, inView: inView!, animated: animated)
            break;
        case .TV:
            //coming soon?
            break;
        case .Unspecified:
            // WTF is this thing???!!!!
            break;
        default:
            break;
        }
    }
    
    private func showForPhone<T:UIViewController where T: imageSourceControllerProtocol> (presentingController: T, animated: Bool) {
        
        let imagePicker: UIImagePickerController = UIImagePickerController()
        imagePicker.delegate = presentingController
        imagePicker.allowsEditing = false
        
        let optionsSheet: UIAlertController = UIAlertController(title: "Select Option:", message: "", preferredStyle: UIAlertControllerStyle.ActionSheet)
        let cameraAction: UIAlertAction = UIAlertAction(title: "Take Photo", style: .Default, handler: {(alert: UIAlertAction!) in
            
            if (!UIImagePickerController.isSourceTypeAvailable(.Camera)) {
                let noCameraAlert: UIAlertController = UIAlertController(title: "Oops", message: "Your device does not have a camera", preferredStyle: UIAlertControllerStyle.Alert)
                let dismiss: UIAlertAction = UIAlertAction(title: "Dismiss", style: .Default, handler: {(alert: UIAlertAction!) in
                    noCameraAlert .dismissViewControllerAnimated(true, completion: nil)
                })
                noCameraAlert.addAction(dismiss)
                presentingController.presentViewController(noCameraAlert, animated: true, completion: nil)
            }else{
                imagePicker.sourceType = .Camera
                presentingController.presentViewController(imagePicker, animated: true, completion: nil)
            }
        })
        
        let galleryAction: UIAlertAction = UIAlertAction(title: "Choose From Gallery", style: .Default, handler: {(alert: UIAlertAction!) in
            imagePicker.sourceType = .PhotoLibrary
            presentingController.presentViewController(imagePicker, animated: true, completion: nil)
        })
        
        optionsSheet.addAction(cameraAction)
        optionsSheet.addAction(galleryAction)
        
        presentingController.presentViewController(optionsSheet, animated: true, completion: nil)
    }
    
    private func showForiPad<T:UIViewController where T: imageSourceControllerProtocol> (presentingController: T, fromRect: CGRect, inView: UIView, animated: Bool) {
        let imagePicker: UIImagePickerController = UIImagePickerController()
        imagePicker.delegate = presentingController
        imagePicker.allowsEditing = false
        
        let optionsSheet: UIAlertController = UIAlertController(title: "Select Option:", message: "", preferredStyle: UIAlertControllerStyle.ActionSheet)
        let cameraAction: UIAlertAction = UIAlertAction(title: "Take Photo", style: UIAlertActionStyle.Default, handler: {(alert: UIAlertAction!) in
            
            if (!UIImagePickerController.isCameraDeviceAvailable(imagePicker.cameraDevice)) {
                let noCameraAlert: UIAlertController = UIAlertController(title: "Oops", message: "Your device does not have a camera", preferredStyle: UIAlertControllerStyle.Alert)
                presentingController.presentViewController(noCameraAlert, animated: true, completion: nil)
            }else{
                imagePicker.sourceType = .Camera
                presentingController.presentViewController(imagePicker, animated: true, completion: nil)
            }
        })
        
        let galleryAction: UIAlertAction = UIAlertAction(title: "Choose From Gallery", style: UIAlertActionStyle.Default, handler: {(alert: UIAlertAction!) in
            imagePicker.sourceType = .PhotoLibrary
            presentingController.presentViewController(imagePicker, animated: true, completion: nil)
        })
        
        optionsSheet.addAction(cameraAction)
        optionsSheet.addAction(galleryAction)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}
