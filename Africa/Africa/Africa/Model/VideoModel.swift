//
//  VideoModel.swift
//  Africa
//
//  Created by Fabiola Correa Padilla on 28/03/23.
//

import Foundation

struct Video: Codable, Identifiable{
    let id: String
    let name: String
    let headline: String
    
    //Computed Property
    var thumbnail: String {
        "video-\(id)"
    }
}
