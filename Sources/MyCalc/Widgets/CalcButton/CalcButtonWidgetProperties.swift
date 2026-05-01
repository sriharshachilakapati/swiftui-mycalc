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
    
    enum CalcDigit : String {
        case zero = "0"
        case one = "1"
        case two = "2"
        case three = "3"
        case four = "4"
        case five = "5"
        case six = "6"
        case seven = "7"
        case eight = "8"
        case nine = "9"
    }
    
    enum CalcOperation : String {
        case add = "+"
        case subtract = "-"
        case multiply = "×"
        case divide = "÷"
        case equals = "="
        case clear = "AC"
        case delete = "⌫"
    }
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
