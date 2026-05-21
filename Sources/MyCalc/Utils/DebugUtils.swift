//
//  DebugUtils.swift
//  MyCalc
//
//  Created by Sri Harsha Chilakapati on 21/05/26.
//

import SwiftUI

extension View {
    func debugDimensions() -> some View {
        return self.overlay {
            GeometryReader { proxy in
                let width = proxy.size.width
                let height = proxy.size.height
                
                ZStack(alignment: .topLeading) {
                    Rectangle()
                        .stroke(.red, lineWidth: 1)
                        .background(.red.opacity(0.1))
                    
                    Text("\(Int(width)) x \(Int(height))")
                        .font(.caption)
                        .padding(4)
                        .background(.black.opacity(0.7))
                        .foregroundStyle(.white)
                }
            }
        }
    }
}
