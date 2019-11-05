//
//  Animal.swift
//  SanDiegoWho
//
//  Created by Jordan Lamb on 11/5/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

import Foundation

class Animal: Codable {
    let animal: String
    let person: String
    let age: Int
    let cohort: String
    let characteristic: String
    
    init(animal: String, person: String, age: Int, cohort: String, characteristic: String) {
        self.animal = animal
        self.person = person
        self.age = age
        self.cohort = cohort
        self.characteristic = characteristic
    }

}
