//
//  CalcKeypadWidgetProvider.swift
//  MyCalc
//
//  Created by Sri Harsha Chilakapati on 25/04/26.
//

import SwiftUI

struct CalcKeypadWidget: View {
    
    var action: (CalcButtonVariant) -> Void

    var body: some View {
        CalcKeypadWidgetCore(action: action)
    }
    
}
