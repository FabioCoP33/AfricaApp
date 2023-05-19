//
//  CenterModifier.swift
//  Africa
//
//  Created by Fabiola Correa Padilla on 24/04/23.
//

import SwiftUI

struct CenterModifier: ViewModifier{
    func body(content: Content) -> some View {
          HStack{
            Spacer()
              content
             Spacer()
        }
    }
}
