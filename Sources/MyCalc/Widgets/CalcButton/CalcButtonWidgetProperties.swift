//
//  CalcButtonWidgetProperties.swift
//  MyCalc
//
//  Created by Sri Harsha Chilakapati on 25/04/26.
//

import SwiftUI

enum CalcButtonVariant : Hashable {
    case digit(CalcDigit)
    case operation(CalcOperation)
}

extension CalcButtonVariant {
    var title: String {
        switch self {
            case .digit(let digit): return digit.rawValue
            case .operation(let operation): return operation.rawValue
        }
    }
    
    var backgroundColor: Color {
        switch self {
            case .digit: return .black.opacity(0.6)
            case .operation: return .red.opacity(0.6)
        }
    }
    
    var textColor: Color {
        switch self {
            case .digit: return .white
            case .operation: return .black
        }
    }
}
