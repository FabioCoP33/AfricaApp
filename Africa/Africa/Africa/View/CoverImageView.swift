//
//  CoverImageView.swift
//  Africa
//
//  Created by Fabiola Correa Padilla on 08/03/23.
//

import SwiftUI

struct CoverImageView: View{

    // Mark: - PROPERTIES
    
    //PASO1: defino la propiedad url
    let url: URL? = URL(string: "https://my-end-point.free.beeceptor.com/covers")
    
    //PASO2: defino el arreglo
    @State private var coverImages: [CoverImage] = []
 
    // Mark: - BOODY
    var body: some View {
        TabView{
            ForEach(coverImages) {item in
                Image (item.name).resizable().scaledToFit()
            }// LOOP:
        }//: Tab
        
        //PASO3: usamos al mofifier tabViewStyle que va a llamar al método loadDataFromURL
        .tabViewStyle(PageTabViewStyle())
                .onAppear {
                    loadDataFromURL()
                }
    }
    //PASO4: implemento la función loadData para decodifidar el JSON y asignarle el arreglo [CoverImage] a la propiedad coverImages
    func loadDataFromURL() {
            guard let url = url else {
                return
            }
            
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                coverImages = try decoder.decode([CoverImage].self, from: data)
            } catch {
                print("Error loading data from URL:", error)
            }
        }
}

// Mark: - PREVIEW

struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView().previewLayout(.fixed(width: 400, height: 300))
    }
}
