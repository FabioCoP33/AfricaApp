//
//  AnimaListItemView.swift
//  Africa
//
//  Created by Fabiola Correa Padilla on 17/03/23.
//

import SwiftUI

struct AnimaListItemView: View {
    // Mark: - PROPERTIES
    
    let animal: Animal
    
    // Mark: - BODY
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(animal.image).resizable().scaledToFill().frame(width: 90, height: 90).clipShape(RoundedRectangle(cornerRadius: 12))
            VStack(alignment: .leading, spacing: 8) {
                Text(animal.name).font(.title2).fontWeight(.heavy).foregroundColor(.accentColor)
                Text(animal.headline).font(.footnote).multilineTextAlignment(.leading).lineLimit(2).padding(.trailing,8)
            }//:VSTACK
            
        }//:HSTACK
    }
}

// Mark: - PREVIEW
struct AnimaListItemView_Previews: PreviewProvider {
    
    static let animals: [Animal] = Bundle.main.decode("animal.json")
    
    static var previews: some View {
        AnimaListItemView(animal: animals[1]).previewLayout(.sizeThatFits).padding()
    }
}
