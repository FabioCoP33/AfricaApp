//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Fabiola Correa Padilla on 23/03/23.
//

import SwiftUI

struct AnimalDetailView: View {
    //Mark: PROPERTIES
    let animal: Animal
    
    
    //Mark: BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment: .center,spacing: 20) {
                //HERO IMAGE
                Image(animal.image).resizable().scaledToFit()
                // TITLE
                Text(animal.name.uppercased()).font(.largeTitle).fontWeight(.heavy).multilineTextAlignment(.center).padding(.vertical, 8).foregroundColor(.primary).background(Color.accentColor.frame(height: 6).offset(y: 24))
                //HEADLINE
                Text(animal.headline).font(.headline).multilineTextAlignment(.leading).foregroundColor(.accentColor).padding(.horizontal)
                //GALLERY
                Group{
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
                    InsetGalleryView(animal: animal)
                }.padding(.horizontal)
                //FACTS
                Group{
                    HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
                }.padding(.horizontal)
                
                InsetFactView(animal: animal)
                //DESCRIPTION
                Group{
                    HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
                }.padding(.horizontal)
                
                Text(animal.description).multilineTextAlignment(.leading).layoutPriority(1)
                //MAP
                Group{
                    HeadingView(headingImage: "map", headingText: "National parks")
                    InsetMapView()
                }.padding(.horizontal)
                //LINK
                Group{
                    HeadingView(headingImage: "books.vertical", headingText: "Learn More...")
                    ExternalWebLinkView(animal: animal)
                }.padding(.horizontal)
                
            }//:VSTACk
            .navigationBarTitle("Learn about \(animal.name)", displayMode: .inline)
        }//:SCROll
        
        
    }
}
//Mark: PREVIEW
struct AnimalDetailView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        NavigationView{
            AnimalDetailView(animal: animals[0])
        }
        .previewDevice("iPhone 11 Pro")
    }
}
