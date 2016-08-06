//
//  PetDetailTableViewController.swift
//  Petopia
//
//  Created by Divisi CodeLabs on 8/6/16.
//  Copyright © 2016 Divisi CodeLabs. All rights reserved.
//

import UIKit

class PetDetailTableViewController: UITableViewController {
    
    var pet: Pet?
    
    @IBOutlet var nameDetailLabel: UILabel!
    @IBOutlet var typeDetailLabel: UILabel!
    @IBOutlet var descDetailLabel: UILabel!
    @IBOutlet var imageDetailLabel: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let pet = pet {
        nameDetailLabel.text = pet.petName
        typeDetailLabel.text = pet.petType
        descDetailLabel.text = pet.petDesc
        imageDetailLabel.image = pet.petPhoto
        }
        
    }
    
}

