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
            
            let contents = mainContent()
            
            GeometryReader { proxy in
                if proxy.size.width <= proxy.size.height {
                    VStack {
                        contents
                    }
                } else {
                    HStack {
                        contents
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    func mainContent() -> some View {
        Group {
            EditorPane()
            
            CalcKeypadWidget { _ in }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(16)
                .debugDimensions()
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ContentView()
}
