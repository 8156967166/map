//
//  ViewController.swift
//  TakingPictures
//
//  Created by Aneesha on 06/10/23.
//

import UIKit

class CameraViewController: UIViewController {
    
    @IBOutlet weak var buttonTakePicture: UIButton!
    @IBOutlet weak var imageCam: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    @IBAction func buttonTakePicture(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
        
    }
}

extension CameraViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        
//        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
//            return
//        }
        imageCam.image = image
    }
}
