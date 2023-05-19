//
//  ContentView.swift
//  Africa
//
//  Created by Fabiola Correa Padilla on 08/03/23.
//

import SwiftUI
struct ContentView: View {
//Mark: Properties

let animals: [Animal] = Bundle.main.decode("animals.json")
let haptics = UIImpactFeedbackGenerator(style: .medium)

@State private var isGridViewActive: Bool = false
@State private var gridLayout: [GridItem] = [GridItem(.flexible())]
@State private var gridColumn: Int = 1
@State private var toolbarIcon: String = "square.grid.2x2"
    
//Mark: Functions

    func gridSwitch (){
    gridLayout = Array(Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1))
        gridColumn = gridLayout.count
        print("Grid number \(gridColumn)")

//Toolbar Image
        switch gridColumn{
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default: toolbarIcon = "square.grid.2x2"
            
        }
        
    }
    var body: some View {
        
        //Mark: Body
        NavigationView{

            Group{
                if !isGridViewActive {
                    List{
                        CoverImageView().frame(height: 266).listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)){
                                    AnimaListItemView(animal: animal)
                                    }//:LINK
                                }//:LOOP
                        CreditsView().modifier(CenterModifier())
                            }//:LIST
                        } else {
                            ScrollView(.vertical, showsIndicators: false) {
                                LazyVGrid(columns: gridLayout, alignment: .center, spacing:  10) {
                                    ForEach(animals) { animal in
                                        NavigationLink(destination: AnimalDetailView(animal: animal)){
                                            AnimalGridItemView(animal:animal)
                                        }//:LINK
                                    }//:LOOP
                                }//:GRID
                                .padding(10)
                                .animation(.easeIn, value: isGridViewActive)
                                        }//:SCROLLVIEW
                                    }//:CONDITION
                                }//:Group
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        withAnimation {
                            isGridViewActive.toggle()
                        }
                    }) {
                        Image(systemName: isGridViewActive ? "list.bullet" : "square.grid.2x2")
                    }
                }
            }

                    .navigationBarTitle("Africa", displayMode:.large).toolbar(){
                        ToolbarItem(placement: .navigationBarTrailing){
                            HStack(spacing: 16){
                               //LIST
                                Button(action: {
                                print ("List view is activated")
                                    isGridViewActive = false
                                    haptics.impactOccurred()
                                }){
                                    Image(systemName: "square.fill.text.grid.1x2").font(.title2).foregroundColor(isGridViewActive ?  .primary: .accentColor)
                                }
                                //GRID
                                Button(action: {
                                    print("Grid view is activated")
                                    isGridViewActive = true
                                    haptics.impactOccurred()
                                    gridSwitch()
                                }){
                                    Image(systemName: toolbarIcon ).font(.title2).foregroundColor(isGridViewActive ? .accentColor: .primary)
                                }
                            }//:HSTACK
                        }//:BUTTONS
                    }//:TOOLBAR
                }//:Navigations
        
    }
}
//Mark: Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice("iPhone 14 Pro")
    }
}
