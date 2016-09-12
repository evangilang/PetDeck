//
//  PetViewController.swift
//  Petopia
//
//  Created by Divisi CodeLabs on 8/6/16.
//  Copyright © 2016 Divisi CodeLabs. All rights reserved.
//

import UIKit

class PetViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    @IBOutlet var petPhotoImageVIew: UIImageView!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var typeTextField: UITextField!
    @IBOutlet var descTextField: UITextField!
    @IBOutlet var saveBarButton: UIBarButtonItem!
    @IBOutlet weak var scrollView: UIScrollView!
    var activeTextField: UIView?
    var pet: Pet?
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

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
    
    
    @IBAction func hideKeyboard(sender: AnyObject) {
        nameTextField.endEditing(true)
        typeTextField.endEditing(true)
        descTextField.endEditing(true)
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        //activeTextField = textField
        //scrollView.scrollEnabled = true
        scrollView.setContentOffset(CGPointMake(0, 150), animated: true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        //activeTextField = nil
        //scrollView.scrollEnabled = false
        scrollView.setContentOffset(CGPointMake(0, 0), animated: true)
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
        let isPresentingInAddPetMode = presentingViewController is UINavigationController
        
        if isPresentingInAddPetMode {
            dismissViewControllerAnimated(true, completion: nil)
        } else {
            navigationController!.popViewControllerAnimated(true)
        }
    }
    
}
