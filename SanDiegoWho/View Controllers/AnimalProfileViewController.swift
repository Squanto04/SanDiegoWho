//
//  AnimalProfileViewController.swift
//  SanDiegoWho
//
//  Created by Jordan Lamb on 11/5/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

import UIKit

class AnimalProfileViewController: UIViewController {
    
    var animal: Animal? {
        didSet {
            loadViewIfNeeded()
            updateViews()
        }
    }

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cohortLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var characteristicLabel: UILabel!
    @IBOutlet weak var animalImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AnimalController.shared.saveToPersistentStore()
        updateDesign()
    }
    
    func updateViews() {
        guard let animal = animal else { return }
        animalImageView.image = UIImage(named: animal.image)
        nameLabel.text = animal.person
        cohortLabel.text = animal.cohort
        ageLabel.text = "\(animal.age)"
        characteristicLabel.text = animal.characteristic
    }

    func updateDesign() {
        animalImageView.layer.cornerRadius = animalImageView.frame.height / 2
    }

}
