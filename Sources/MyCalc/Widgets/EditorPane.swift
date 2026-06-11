//
//  EditorPane.swift
//  MyCalc
//
//  Created by Sri Harsha Chilakapati on 23/04/26.
//

import SwiftUI

struct EditorPane: View {
    var displayText: String

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Color.gray
                .mix(with: .white, by: 0.4)
                .clipShape(RoundedRectangle(cornerRadius: 16))

            Text(displayText)
                .font(.largeTitle)
                .foregroundStyle(.black)
                .padding(16)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    EditorPane(displayText: "3590")
}
