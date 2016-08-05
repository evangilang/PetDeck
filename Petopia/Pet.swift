//
//  Pet.swift
//  Petopia
//
//  Created by Divisi CodeLabs on 8/5/16.
//  Copyright © 2016 Divisi CodeLabs. All rights reserved.
//

import Foundation

class Pet {
    var petName: String
    var petDesc: String
    var petType: String
    
    init(petName: String, petDesc: String, petType: String) {
        self.petName = petName
        self.petDesc = petDesc
        self.petType = petType
    }
}
