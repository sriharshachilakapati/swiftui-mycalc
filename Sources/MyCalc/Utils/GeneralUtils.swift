//
//  GeneralUtils.swift
//  SwiftUI-MyCalc
//
//  Created by Sri Harsha Chilakapati on 09/06/26.
//

import Foundation
import SwiftUI

func formattedNumber(number: Double) -> String {
    if number.isNaN || number.isInfinite {
        return "Error"
    }

    if Double(Int(number)) == number {
        return "\(Int(number))"
    }

    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.maximumFractionDigits = 2
    return formatter.string(from: NSNumber(value: number)) ?? "\(number)"
}

extension View {
    @ViewBuilder
    func conditional<Content: View>(if condition: Bool, block: (Self) -> Content) -> some View {
        if condition {
            block(self)
        } else {
            self
        }
    }
}
