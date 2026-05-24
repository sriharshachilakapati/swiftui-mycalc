//
//  ContentView.swift
//  MyCalc
//
//  Created by Sri Harsha Chilakapati on 19/04/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.gray
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                EditorPane()
                
                CalcKeypadWidget { _ in }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(16)
                    .debugDimensions()
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ContentView()
}
