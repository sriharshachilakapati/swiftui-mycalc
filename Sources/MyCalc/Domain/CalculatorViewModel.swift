//
//  CalculatorViewModel.swift
//  MyCalc
//
//  Created by Sri Harsha Chilakapati on 04/06/26.
//

import Combine
import Observation

@Observable
class CalculatorViewModel {

    private var state = CalculatorState()

    public var display: String {
        if state.current.isEmpty {
            formattedNumber(number: state.result)
        } else {
            formattedNumber(number: state.getCurrentValue())
        }
    }

    public func buttonTapped(digit: CalcDigit) {
        state.current.append(digit.doubleValue)
    }

    public func buttonTapped(operation: CalcOperation) {
        switch operation {
            case .clear:
                state = CalculatorState()

            case .delete:
                if !state.current.isEmpty {
                    state.current.removeLast()
                } else {
                    state = CalculatorState()
                }

            case .equals:
                if let function = state.operatorFunc {
                    let result = function.apply(lhs: state.result, rhs: state.getCurrentValue())
                    state = CalculatorState(result: result)
                } else if !state.current.isEmpty {
                    let result = state.getCurrentValue()
                    state = CalculatorState(result: result)
                }

            default:
                buttonTapped(operation: .equals)
                state.operatorFunc = operation
        }
    }
}
