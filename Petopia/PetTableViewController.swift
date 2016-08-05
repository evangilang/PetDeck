//
//  PetViewController.swift
//  Petopia
//
//  Created by Divisi CodeLabs on 8/5/16.
//  Copyright © 2016 Divisi CodeLabs. All rights reserved.
//

import UIKit

class PetTableViewController: UITableViewController {
    var pets = [Pet]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPets()
    }
    
    func loadPets(){
        let petPhoto1 = UIImage(named: "GingerCat")
        let pet1 = Pet(petName: "Inci", petDesc: "Kucing pemalas", petType: "Cat", petPhoto: petPhoto1!)
        
        let petPhoto2 = UIImage(named: "bird3")
        let pet2 = Pet(petName: "Birdy", petDesc: "Burung yang suka lupa kalo dirinya burung", petType: "Bird", petPhoto: petPhoto2!)
        
        pets += [pet1,pet2]
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pets.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifierCell = "cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(identifierCell, forIndexPath: indexPath) as! PetTableViewCell
        let pet = pets[indexPath.row]
        cell.petNameLabel.text = pet.petName
        cell.petTypeLabel.text = pet.petType
        cell.petDescLabel.text = pet.petDesc
        cell.petPhotoImageView.image = pet.petPhoto
        return cell
    }
    
    
}
