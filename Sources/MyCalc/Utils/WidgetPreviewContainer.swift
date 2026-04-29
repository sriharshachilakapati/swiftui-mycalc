//
//  WidgetPreviewContainer.swift
//  MyCalc
//
//  Created by Sri Harsha Chilakapati on 25/04/26.
//

import SwiftUI

struct WidgetPreviewContainer<Item: Hashable, Content: View> : View {
    
    private let items: [Item]
    private let content: (Item) -> Content
    
    init(items: [Item], content: @escaping (Item) -> Content) {
        self.items = items
        self.content = content
    }
    
    init(content: @escaping () -> Content) where Item == Int {
        self.items = [ 0 ]
        self.content = { _ in content() }
    }
    
    private var columns: [GridItem] {
        let count = Int(ceil(sqrt(Double(items.count))))
        return Array(repeating: GridItem(.flexible()), count: count)
    }
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 12) {
            ForEach(items, id: \.self) { item in
                content(item)
            }
            .padding()
        }
    }
    
}
