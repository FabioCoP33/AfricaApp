//
//  InsetGalleryView.swift
//  Africa
//
//  Created by Fabiola Correa Padilla on 23/03/23.
//

import SwiftUI

struct InsetGalleryView: View {
    //Mark: PROPERTIES
    let animal: Animal
    
    //Mark: BODY
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators:false){
            HStack(alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id: \.self) { item in
                    Image(item).resizable().scaledToFit().frame(height: 200).cornerRadius(12)
                }//:LOOP
            }//:HSTACK
        }//:SCROLL
    }
}

//Mark: Preview
struct InsetGalleryView_Previews: PreviewProvider {
    
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        InsetGalleryView(animal: animals[0]).previewLayout(.sizeThatFits).padding()
    }
}
