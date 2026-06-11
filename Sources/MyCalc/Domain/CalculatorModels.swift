//
//  CalculatorModels.swift
//  MyCalc
//
//  Created by Sri Harsha Chilakapati on 04/06/26.
//

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

struct CalculatorState {
    var result: Double = 0
    var current: [Double] = []
    var operatorFunc: OperatorFunction? = nil
}
