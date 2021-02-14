//
//  ImagePickerViewController.swift
//  prog31632-a1
//
//  Created by Yiyao Zhang on 2021-02-05.
//

import UIKit

class ImagePickerViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // link the image view
    @IBOutlet weak var imageView: UIImageView!
    // create a controller, in use of getting image use selected.
    var imagePickerController: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // set default img
        imageView.image = UIImage(named: "AddAPhoto.png")
        // enable interation (to let gesture works)
        imageView.isUserInteractionEnabled = true
    }
    
    // user clicks gesturn area
    @IBAction func touchImageButton(_ sender: UITapGestureRecognizer) {
        // invoke function
        getPhoto()
    }
    
    // UIImagePickerControllerDelegate, change image after user had selected one.
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // quit view
        imagePickerController.dismiss(animated: true, completion: nil)
        // set image
        imageView.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
    }
    
    func getPhoto() {
        // create instance
        imagePickerController = UIImagePickerController()
        // select from photo library (require privacy declaration on info.plist)
        imagePickerController.sourceType = .photoLibrary
        // original photo only
        imagePickerController.allowsEditing = false
        // delegate is self
        imagePickerController.delegate = self
        // show
        present(imagePickerController, animated: true, completion: nil)
    }
}
