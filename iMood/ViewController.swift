//
//  ViewController.swift
//  iMood
//
//  Created by Envoy on 6/5/17.
//  Copyright © 2017 mmn. All rights reserved.
//

import UIKit
import Vision

class ViewController: UIViewController {
    @IBOutlet fileprivate weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func selectImagePushed(_ sender: Any) {
        if let hero = imageView.image?.cgImage {
            let requestHandler = VNImageRequestHandler(cgImage: hero)
            
            
            let visionRequest = VNDetectFaceLandmarksRequest() { (request, error) in
                print(request.results)
            }
            
            VNDet
        }
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //todo: utilize vision api to find features
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.imageView.image = pickedImage
        }
    }
}

