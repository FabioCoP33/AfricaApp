//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Fabiola Correa Padilla on 04/04/23.
//

import SwiftUI

struct AnimalGridItemView: View {
    //Mark: PROPERTIES
    
    let animal: Animal
    
    
    //Mark: BODY
    var body: some View {
        
        Image(animal.image).resizable().scaledToFill().cornerRadius(12)
    }
}


//Mark: PREVIEW
struct AnimalGridItemView_Previews: PreviewProvider {
    
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        AnimalGridItemView(animal: animals[0]).previewLayout(.sizeThatFits).padding()
    }
}
