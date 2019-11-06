//
//  Animal.swift
//  SanDiegoWho
//
//  Created by Jordan Lamb on 11/5/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

import UIKit

class Animal: Codable {
    let tag: Int
    let animal: String
    let person: String
    let age: Int
    let cohort: String
    let characteristic: String
    let image: String
    
    init(tag: Int, animal: String, person: String, age: Int, cohort: String, characteristic: String, image: String) {
        self.tag = tag
        self.animal = animal
        self.person = person
        self.age = age
        self.cohort = cohort
        self.characteristic = characteristic
        self.image = image
    }

}
