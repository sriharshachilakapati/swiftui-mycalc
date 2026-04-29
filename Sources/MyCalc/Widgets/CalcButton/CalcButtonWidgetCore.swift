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
    
    private var width: CGFloat = 40
    private var height: CGFloat = 40
    
    var body: some View {
        Button(action: action) {
            Text(label)
                .padding(6)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .font(.system(size: 18))
                .foregroundStyle(foregroundColor)
                .background(backgroundColor)
        }
        .frame(width: width, height: height)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
    
    func buttonSize(width: CGFloat, height: CGFloat) -> some View {
        var copy = self
        copy.width = width
        copy.height = height
        return copy
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
}
