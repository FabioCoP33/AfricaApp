//
//  CodableBoundleExtension.swift
//  Africa
//
//  Created by Fabiola Correa Padilla on 15/03/23.
//

import Foundation
extension Bundle {
    func decode<T: Codable>(_ file: String)-> T {
        
        //1.- Locate the JSON file
        guard let url = self.url(forResource: file, withExtension: nil) else{fatalError("Failed to locate \(file)in bundle")
        }
        
        //2.- Create a property for the data
        guard let data = try? Data(contentsOf: url)else{fatalError("Failed to load \(file) in bundle")
        }
        
        
        //3.- Create a JSON decoder
        let decoder = JSONDecoder()
        
        
        //4.- Decode the data and collect
        //the information with a new property
        guard let loaded = try? decoder.decode(T.self, from:data)else{fatalError("Failed to decode \(file)in bundle")
        }
        
        
        //5.- Return the ready-to-use data
        return loaded
    }
}
