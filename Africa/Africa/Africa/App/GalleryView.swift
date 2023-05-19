//
//  GalleryView.swift
//  Africa
//
//  Created by Fabiola Correa Padilla on 08/03/23.
//

import SwiftUI

struct GalleryView: View {
    //Mark: Properties
    @State private var selectedAnimal: String = "lion"
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    //SIMPLE GRID DEFINITION
    //let gridLayout: [GridItem] = [GridItem(.flexible()),
        //GridItem(.flexible()),
       // GridItem(.flexible())]
    
    
    //EFICIENT GRID DEFINITION
   // let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count:3)
    
 //Dynamic Grid Layout
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColum: Double = 3.0
    func gridSwitch(){
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColum))
    }
    
    //Mark: Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
         
            VStack (alignment: .center, spacing: 30){
               
                //Mark: IMAGE
                Image(selectedAnimal).resizable().scaledToFill().clipShape(Circle()).overlay(Circle().stroke(Color.white,lineWidth: 8))
                
                //Mark Slider
                
                Slider(value: $gridColum, in: 2...4, step: 1).padding(.horizontal).onChange(of: gridColum, perform: {value in gridSwitch()
                    
                })
                //Mark: GRID                
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white,lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = item.image
                                haptics.impactOccurred()
                            }
                            .animation(.easeIn, value: selectedAnimal)
                    }//:LOOP
                }//:GRID
                .onAppear(perform: { gridSwitch() })
                
            }//:VStack
            .padding(.horizontal, 10).padding(.vertical, 50)
        }//:Scroll
        .frame(maxWidth: .infinity, maxHeight: .infinity).background(MotionAnimationView())
    }
}
//Mark: Preview
struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
