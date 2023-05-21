//
//  AnimalModel.swift
//  Africa
//
//  Created by Fabiola Correa Padilla on 17/03/23.
//

import Foundation

struct Response: Codable {
    let animals: [Animal]
}

struct Animal: Codable {
    let name: String
    let image: String
    let headline: String
    let description: String
    let link: String
    let gallery: [String]
    let fact: [String]
}
