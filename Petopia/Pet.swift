//
//  Pet.swift
//  Petopia
//
//  Created by Divisi CodeLabs on 8/5/16.
//  Copyright © 2016 Divisi CodeLabs. All rights reserved.
//

import UIKit

class Pet {
    var petName: String
    var petDesc: String
    var petType: String
    var petPhoto: UIImage?
    
    init(petName: String, petDesc: String, petType: String, petPhoto: UIImage) {
        self.petName = petName
        self.petDesc = petDesc
        self.petType = petType
        self.petPhoto = petPhoto
    }
}
