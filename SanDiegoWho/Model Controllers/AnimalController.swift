//
//  AnimalController.swift
//  SanDiegoWho
//
//  Created by Jordan Lamb on 11/5/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

import UIKit

class AnimalController {
    
    static let shared = AnimalController()
    
    var animals: [Animal] = mockData
    
    private func fileURL() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileName = "SanDiegoWho"
        let documentsDirectoryURL = urls[0].appendingPathComponent(fileName)
        return documentsDirectoryURL
    }
    
    func saveToPersistentStore() {
        let jsonEncoder = JSONEncoder()
        do {
            let jsonAnimals = try jsonEncoder.encode(animals)
            try jsonAnimals.write(to: fileURL())
        } catch let encodingError {
            print("There was an error saving the data: \(encodingError)")
        }
    }
    
    func loadFromPersistentStore() {
        let jsonDecoder = JSONDecoder()
        do {
            let jsonData = try Data(contentsOf: fileURL())
            let decodedAnimals = try jsonDecoder.decode([Animal].self, from: jsonData)
            animals = decodedAnimals
        } catch let decodingError {
            print("There was an error decoding there data: \(decodingError)")
        }
    }
}

let mockData: [Animal] = {
    let meheza = Animal(tag: 7, animal: "Lioness", person: "Meheza", age: 29, cohort: "QA", characteristic: "Regal", image: "lioness")
    let luke = Animal(tag: 5, animal: "Elephant", person: "Luke", age: 28, cohort: "QA", characteristic: "Smart, Amazing Memory, Emotionally intelligent", image: "elephant")
    let jordan = Animal(tag: 1, animal: "Shark", person: "Jordan", age: 26, cohort: "iOS", characteristic: "Sharks have a sixth sense: Being Dope", image: "shark")
    let bethany = Animal(tag: 2, animal: "Otter", person: "Bethany", age: 22, cohort: "iOS", characteristic: "Love to bask in the sun, ride the waves, play with fellow otters", image: "otter")
    let mac = Animal(tag: 3, animal: "Frog", person: "Mac", age: 26, cohort: "QA", characteristic: "Frogs are good at finding bugs", image: "frog")
    let sam = Animal(tag: 6, animal: "Toucan", person: "Sam", age: 19, cohort: "QA", characteristic: "Fruit Loops", image: "toucan")
    let matt = Animal(tag: 8, animal: "Penguin", person: "Matt", age: 34, cohort: "iOS", characteristic: "Always dressed to impressed", image: "penguin")
    let gretchen = Animal(tag: 9, animal: "Panda", person: "Gretchen", age: 30, cohort: "UX Design", characteristic: "Playful, friendly, hungry", image: "panda")
    let steve = Animal(tag: 4, animal: "Fish", person: "Steve", age: 36, cohort: "UX Design", characteristic: "Love to swim", image: "fish")
    let hayley = Animal(tag: 10, animal: "Llama", person: "Hayley", age: 29, cohort: "UX Design", characteristic: "Calm, friendly", image: "llama")
    
    return [jordan, bethany, mac, steve, luke, sam, meheza, matt, gretchen, hayley]
}()
