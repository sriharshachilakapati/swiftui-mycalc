//
//  CalcButtonWidgetProvider.swift
//  MyCalc
//
//  Created by Sri Harsha Chilakapati on 25/04/26.
//

import SwiftUI

struct CalcButtonWidget : View {
    
    var variant: CalcButtonVariant
    var action: (CalcButtonVariant) -> Void
    
    init (variant: CalcButtonVariant, action: @escaping (CalcButtonVariant) -> Void) {
        self.variant = variant
        self.action = action
    }
    
    var body: some View {
        CalcButtonWidgetCore(
            label: variant.title,
            backgroundColor: variant.backgroundColor,
            foregroundColor: variant.textColor
        ) {
            action(variant)
        }
    }
}
