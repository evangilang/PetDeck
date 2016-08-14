//
//  PetViewController.swift
//  Petopia
//
//  Created by Divisi CodeLabs on 8/6/16.
//  Copyright © 2016 Divisi CodeLabs. All rights reserved.
//

import UIKit

class PetViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet var petPhotoImageVIew: UIImageView!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var typeTextField: UITextField!
    @IBOutlet var descTextField: UITextField!
    @IBOutlet var saveBarButton: UIBarButtonItem!
    
    var pet: Pet?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let pet = pet {
            petPhotoImageVIew.image = pet.petPhoto
            nameTextField.text = pet.petName
            typeTextField.text = pet.petType
            descTextField.text = pet.petDesc
        }
        
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        petPhotoImageVIew.image = selectedImage
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func selectImagePicker(sender: UITapGestureRecognizer) {
        print("Tapped")
        //nameTextField.resignFirstResponder()
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .PhotoLibrary
        imagePicker.delegate = self
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveBarButton === sender {
            let name = nameTextField.text ?? ""
            let type = typeTextField.text
            let desc = descTextField.text
            let photo = petPhotoImageVIew.image
            
            pet = Pet(petName: name, petDesc: desc!, petType: type!, petPhoto: photo!)
        }
    }
    /*@IBAction func cancel(sender: AnyObject) {
        print("tapped")
        dismissViewControllerAnimated(true, completion: nil)
    }*/
    @IBAction func cancel(sender: UIBarButtonItem) {
        let isPresentingInAddMealMode = presentingViewController is UINavigationController
        
        if isPresentingInAddMealMode {
            dismissViewControllerAnimated(true, completion: nil)
        } else {
            navigationController!.popViewControllerAnimated(true)
        }
    }
    
}
