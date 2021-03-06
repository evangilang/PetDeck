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
    var pet: Pet?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPets()
    }
    
    func loadPets(){
        let petPhoto1 = UIImage(named: "tabby")
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "PetDetail" {
            let destinationViewController = segue.destinationViewController as! PetViewController
            if let selectedPetCell = sender as? PetTableViewCell {
                let indexPath = tableView.indexPathForCell(selectedPetCell)!
                let selectedPet = pets[indexPath.row]
                destinationViewController.pet = selectedPet
                
            }
        } else if segue.identifier == "AddItem" {
            print("adding item")
        }
    }
    
    @IBAction func unwindToPetList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as? PetViewController, pet = sourceViewController.pet {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
             pets[selectedIndexPath.row] = pet
                tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)
            } else {
            let newIndexPath = NSIndexPath(forRow: pets.count, inSection: 0)
            pets.append(pet)
            tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
            }
        }
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            pets.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
        //tableView.reloadData()
    }

    
}
