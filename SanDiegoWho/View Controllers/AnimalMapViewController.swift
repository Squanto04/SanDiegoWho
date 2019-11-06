//
//  AnimalMapViewController.swift
//  SanDiegoWho
//
//  Created by Jordan Lamb on 11/5/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

import UIKit

class AnimalMapViewController: UIViewController {
    
    var senderTag: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    @IBAction func animalButtonTapped(_ sender: UIButton) {
        self.senderTag = sender.tag - 1
        performSegue(withIdentifier: "toProfileDetailVC", sender: self)
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toProfileDetailVC" {
            guard let destinationVC = segue.destination as? AnimalProfileViewController else { return }
            let objectToSend = AnimalController.shared.animals[senderTag]
            destinationVC.animal = objectToSend
        }
    }

}
