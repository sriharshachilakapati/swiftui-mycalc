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
