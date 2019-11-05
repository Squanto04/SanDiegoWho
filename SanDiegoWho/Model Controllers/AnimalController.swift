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
    
    var animals: [Animal] = []
    
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
