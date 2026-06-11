//
//  CalcButtonWidgetCore.swift
//  MyCalc
//
//  Created by Sri Harsha Chilakapati on 25/04/26.
//

import SwiftUI

struct CalcButtonWidgetCore: View {
    
    var label: String
    var backgroundColor: Color
    var foregroundColor: Color
    var action: () -> Void
    
    init(label: String, backgroundColor: Color, foregroundColor: Color, action: @escaping () -> Void) {
        self.label = label
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            Text(label)
                .padding(6)
                .frame(
                    maxWidth: .infinity,
                    minHeight: 50,
                    maxHeight: .infinity
                )
                .font(.system(size: 18))
                .foregroundStyle(foregroundColor)
                .background(backgroundColor)
        }
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CalcButtonWidgetCore(
        label: "AC",
        backgroundColor: .blue,
        foregroundColor: .white
    ) {
        // EMPTY
    }
    .frame(width: 40, height: 40)
}
