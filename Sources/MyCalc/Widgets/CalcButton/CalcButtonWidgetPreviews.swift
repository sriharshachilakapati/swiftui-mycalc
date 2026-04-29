//
//  CalcButtonWidgetPreviews.swift
//  MyCalc
//
//  Created by Sri Harsha Chilakapati on 25/04/26.
//

import SwiftUI

#Preview(traits: .sizeThatFitsLayout) {
    WidgetPreviewContainer(
        items: [
            .digit(.nine),
            .digit(.zero),
            .operation(.divide),
            .operation(.multiply),
            .operation(.add),
            .operation(.subtract)
        ]
    ) { variant in
        CalcButtonWidget(variant: variant) { _ in }
    }
}
