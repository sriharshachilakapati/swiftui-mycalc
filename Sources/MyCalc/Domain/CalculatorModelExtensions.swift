//
//  CalculatorModelExtensions.swift
//  MyCalc
//
//  Created by Sri Harsha Chilakapati on 04/06/26.
//

protocol DoubleConvertible {
    var doubleValue: Double { get }
}

protocol OperatorFunction {
    func apply(lhs: Double, rhs: Double) -> Double
}

extension CalcDigit : DoubleConvertible {
    var doubleValue: Double {
        return Double(rawValue) ?? 0
    }
}

extension CalcOperation : OperatorFunction {
    func apply(lhs: Double, rhs: Double) -> Double {
        switch self {
            case .add: return lhs + rhs
            case .subtract: return lhs - rhs
            case .multiply: return lhs * rhs
            case .divide: return lhs / rhs
            default: return lhs
        }
    }
}

extension CalculatorState {
    func getCurrentValue() -> Double {
        var value: Double = 0

        for digit in current {
            value *= 10
            value += digit
        }

        return value
    }
}
