//
//  ExternalWebLinkView.swift
//  Africa
//
//  Created by Fabiola Correa Padilla on 27/03/23.
//

import SwiftUI

struct ExternalWebLinkView: View {
    //:PROPERTIES
    let animal: Animal
    
    //:BODY
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                Group{
                    Image(systemName: "arrow.up.right.square")
                    Link(animal.name, destination: (URL(string: animal.link) ?? URL(string: "https//:www.wikipedia.com"))!)
                }.foregroundColor(.accentColor)
            }//:HSTACK
        }//:Box
    }
}
//:PREVIEW
struct ExternalWebLinkView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        ExternalWebLinkView(animal: animals[0]).previewLayout(.sizeThatFits).padding()
    }
}
