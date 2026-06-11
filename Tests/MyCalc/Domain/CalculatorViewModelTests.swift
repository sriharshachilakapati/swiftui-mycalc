//
//  CalculatorViewModelTests.swift
//  MyCalc
//
//  Created by Sri Harsha Chilakapati on 04/06/26.
//

import XCTest

@testable import MyCalc

final class CalculatorViewModelTests: XCTestCase {

    var sut: CalculatorViewModel!

    override func setUp() {
        super.setUp()
        sut = CalculatorViewModel()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    // MARK: - Basic Input

    func test_typingDigits_updatesDisplay() {
        sut.buttonTapped(digit: .one)
        sut.buttonTapped(digit: .two)
        sut.buttonTapped(digit: .three)
        XCTAssertEqual(sut.display, "123")
    }

    func test_clear_resetsDisplay() {
        sut.buttonTapped(digit: .five)
        sut.buttonTapped(operation: .clear)
        XCTAssertEqual(sut.display, "0")
    }

    func test_delete_removesLastDigit() {
        sut.buttonTapped(digit: .one)
        sut.buttonTapped(digit: .two)
        sut.buttonTapped(operation: .delete)
        XCTAssertEqual(sut.display, "1")
    }

    // MARK: - Basic Arithmetic

    func test_addition() {
        sut.buttonTapped(digit: .three)
        sut.buttonTapped(operation: .add)
        sut.buttonTapped(digit: .five)
        sut.buttonTapped(operation: .equals)
        XCTAssertEqual(sut.display, "8")
    }

    func test_operatorChaining_computesPreviousFirst() {
        // 3 + 5 × 2 should compute (3+5)=8 first, then 8×2=16
        sut.buttonTapped(digit: .three)
        sut.buttonTapped(operation: .add)
        sut.buttonTapped(digit: .five)
        sut.buttonTapped(operation: .multiply)  // ← this is where bug #4 triggers
        sut.buttonTapped(digit: .two)
        sut.buttonTapped(operation: .equals)
        XCTAssertEqual(sut.display, "16")
    }

    // MARK: - Operator with NO input

    func test_operatorWithNoInput_doesNotCrash() {
        // Pressing + immediately should treat 0 as lhs
        sut.buttonTapped(operation: .add)
        sut.buttonTapped(digit: .five)
        sut.buttonTapped(operation: .equals)
        XCTAssertEqual(sut.display, "5")   // 0 + 5 = 5
    }

    func test_divisionByZero_showsError() {
        sut.buttonTapped(digit: .five)
        sut.buttonTapped(operation: .divide)
        sut.buttonTapped(digit: .zero)
        sut.buttonTapped(operation: .equals)
        XCTAssertEqual(sut.display, "Error")   // not "inf"
    }

    func test_integerResultsHaveNoDecimalPoint() {
        // Currently displays "8.0" — should be "8"
        sut.buttonTapped(digit: .three)
        sut.buttonTapped(operation: .add)
        sut.buttonTapped(digit: .five)
        sut.buttonTapped(operation: .equals)
        XCTAssertEqual(sut.display, "8")   // not "8.0"
    }

    func test_swappingOperator_doesNotLoseLhs() {
        // 3 + × 5 — user changes mind about operator, should still be 3 × 5 = 15
        sut.buttonTapped(digit: .three)
        sut.buttonTapped(operation: .add)
        sut.buttonTapped(operation: .multiply)   // swap before typing rhs
        sut.buttonTapped(digit: .five)
        sut.buttonTapped(operation: .equals)
        XCTAssertEqual(sut.display, "15")
    }
}
