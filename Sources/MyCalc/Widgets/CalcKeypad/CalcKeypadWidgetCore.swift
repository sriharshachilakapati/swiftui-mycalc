//
//  CalcKeypadWidgetCore.swift
//  MyCalc
//
//  Created by Sri Harsha Chilakapati on 25/04/26.
//

import SwiftUI

struct CalcKeypadWidgetCore: View {
    
    private let spacing: CGFloat = 12
    private let buttonSize: CGFloat = 40

    var action: (CalcButtonVariant) -> Void
    
    init(action: @escaping (CalcButtonVariant) -> Void) {
        self.action = action
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: spacing) {
            VStack(alignment: .leading, spacing: spacing) {
                HStack(alignment: .top, spacing: spacing) {
                    button(.operation(.clear))
                    button(.operation(.divide))
                    button(.operation(.multiply))
                }
                
                HStack(alignment: .top, spacing: spacing) {
                    button(.digit(.seven))
                    button(.digit(.eight))
                    button(.digit(.nine))
                }
                
                HStack(alignment: .top, spacing: spacing) {
                    button(.digit(.four))
                    button(.digit(.five))
                    button(.digit(.six))
                }
                
                HStack(alignment: .top, spacing: spacing) {
                    button(.digit(.one))
                    button(.digit(.two))
                    button(.digit(.three))
                }
                
                HStack(alignment: .top, spacing: spacing) {
                    wideButton(.digit(.zero))
                    button(.operation(.delete))
                }
            }
            .frame(maxWidth: .infinity)
            
            VStack(alignment: .leading, spacing: spacing) {
                button(.operation(.subtract))
                tallButton(.operation(.add))
                tallButton(.operation(.equals))
            }
        }
        .frame(maxHeight: .infinity)
    }
    
    private func button(_ variant: CalcButtonVariant) -> some View {
        CalcButtonWidget(variant: variant, action: action)
            .buttonSize(width: buttonSize, height: buttonSize)
    }
    
    private func wideButton(_ variant: CalcButtonVariant) -> some View {
        CalcButtonWidget(variant: variant, action: action)
            .buttonSize(width: buttonSize * 2 + spacing, height: buttonSize)
    }
    
    private func tallButton(_ variant: CalcButtonVariant) -> some View {
        CalcButtonWidget(variant: variant, action: action)
            .buttonSize(width: buttonSize, height: buttonSize * 2 + spacing)
    }
}
