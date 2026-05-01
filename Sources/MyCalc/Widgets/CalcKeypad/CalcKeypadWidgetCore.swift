//
//  CalcKeypadWidgetCore.swift
//  MyCalc
//
//  Created by Sri Harsha Chilakapati on 25/04/26.
//

import SwiftUI

struct CalcKeypadWidgetCore: View {

    var action: (CalcButtonVariant) -> Void
    
    init(action: @escaping (CalcButtonVariant) -> Void) {
        self.action = action
    }
    
    var body: some View {
        GridLayout(columns: 4, spacing: 12) {
            CalcButtonWidget(variant: .operation(.clear), action: action)
            CalcButtonWidget(variant: .operation(.divide), action: action)
            CalcButtonWidget(variant: .operation(.multiply), action: action)
            CalcButtonWidget(variant: .operation(.subtract), action: action)
            
            CalcButtonWidget(variant: .digit(.seven), action: action)
            CalcButtonWidget(variant: .digit(.eight), action: action)
            CalcButtonWidget(variant: .digit(.nine), action: action)
            
            CalcButtonWidget(variant: .operation(.add), action: action)
                .gridSpan(rows: 2)
            
            CalcButtonWidget(variant: .digit(.four), action: action)
            CalcButtonWidget(variant: .digit(.five), action: action)
            CalcButtonWidget(variant: .digit(.six), action: action)
            
            CalcButtonWidget(variant: .digit(.one), action: action)
            CalcButtonWidget(variant: .digit(.two), action: action)
            CalcButtonWidget(variant: .digit(.three), action: action)
            
            CalcButtonWidget(variant: .operation(.equals), action: action)
                .gridSpan(rows: 2)

            CalcButtonWidget(variant: .digit(.zero), action: action)
                .gridSpan(cols: 2)
            
            CalcButtonWidget(variant: .operation(.delete), action: action)
        }
    }
    
}
