//
//  IMImageSourceAlertController.swift
//  iMood
//
//  Created by Matt  North on 4/12/16.
//  Copyright © 2016 Matt  North. All rights reserved.
//

import UIKit

typealias imageSourceControllerProtocol = UIImagePickerControllerDelegate & UINavigationControllerDelegate

class IMImageSourceAlertController: UIAlertController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func show<T:UIViewController> (_ presentingController: T, animated: Bool, inView: UIView?, fromRect: CGRect?) where T: imageSourceControllerProtocol {
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            // It's an iPhone
            showForPhone(presentingController, animated: animated)
            break;
        case .pad:
            // It's an iPad
            showForiPad(presentingController, fromRect: fromRect!, inView: inView!, animated: animated)
            break;
        case .tv:
            //coming soon?
            break;
        case .unspecified:
            // WTF is this thing???!!!!
            break;
        default:
            break;
        }
    }
    
    fileprivate func showForPhone<T:UIViewController> (_ presentingController: T, animated: Bool) where T: imageSourceControllerProtocol {
        
        let imagePicker: UIImagePickerController = UIImagePickerController()
        imagePicker.delegate = presentingController
        imagePicker.allowsEditing = false
        
        let optionsSheet: UIAlertController = UIAlertController(title: "Select Option:", message: "", preferredStyle: UIAlertControllerStyle.actionSheet)
        let cameraAction: UIAlertAction = UIAlertAction(title: "Take Photo", style: .default, handler: {(alert: UIAlertAction!) in
            
            if (!UIImagePickerController.isSourceTypeAvailable(.camera)) {
                let noCameraAlert: UIAlertController = UIAlertController(title: "Oops", message: "Your device does not have a camera", preferredStyle: UIAlertControllerStyle.alert)
                let dismiss: UIAlertAction = UIAlertAction(title: "Dismiss", style: .default, handler: {(alert: UIAlertAction!) in
                    noCameraAlert .dismiss(animated: true, completion: nil)
                })
                noCameraAlert.addAction(dismiss)
                presentingController.present(noCameraAlert, animated: true, completion: nil)
            }else{
                imagePicker.sourceType = .camera
                presentingController.present(imagePicker, animated: true, completion: nil)
            }
        })
        
        let galleryAction: UIAlertAction = UIAlertAction(title: "Choose From Gallery", style: .default, handler: {(alert: UIAlertAction!) in
            imagePicker.sourceType = .photoLibrary
            presentingController.present(imagePicker, animated: true, completion: nil)
        })
        
        optionsSheet.addAction(cameraAction)
        optionsSheet.addAction(galleryAction)
        
        presentingController.present(optionsSheet, animated: true, completion: nil)
    }
    
    fileprivate func showForiPad<T:UIViewController> (_ presentingController: T, fromRect: CGRect, inView: UIView, animated: Bool) where T: imageSourceControllerProtocol {
        let imagePicker: UIImagePickerController = UIImagePickerController()
        imagePicker.delegate = presentingController
        imagePicker.allowsEditing = false
        
        let optionsSheet: UIAlertController = UIAlertController(title: "Select Option:", message: "", preferredStyle: UIAlertControllerStyle.actionSheet)
        let cameraAction: UIAlertAction = UIAlertAction(title: "Take Photo", style: UIAlertActionStyle.default, handler: {(alert: UIAlertAction!) in
            
            if (!UIImagePickerController.isCameraDeviceAvailable(imagePicker.cameraDevice)) {
                let noCameraAlert: UIAlertController = UIAlertController(title: "Oops", message: "Your device does not have a camera", preferredStyle: UIAlertControllerStyle.alert)
                presentingController.present(noCameraAlert, animated: true, completion: nil)
            }else{
                imagePicker.sourceType = .camera
                presentingController.present(imagePicker, animated: true, completion: nil)
            }
        })
        
        let galleryAction: UIAlertAction = UIAlertAction(title: "Choose From Gallery", style: UIAlertActionStyle.default, handler: {(alert: UIAlertAction!) in
            imagePicker.sourceType = .photoLibrary
            presentingController.present(imagePicker, animated: true, completion: nil)
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
