//
//  CalcKeypadWidgetProvider.swift
//  MyCalc
//
//  Created by Sri Harsha Chilakapati on 25/04/26.
//

import SwiftUI

struct CalcKeypadWidget: View {
    
    var action: (CalcButtonVariant) -> Void
    
    init(action: @escaping (CalcButtonVariant) -> Void) {
        self.action = action
    }
    
    var body: some View {
        CalcKeypadWidgetCore(action: action)
    }
    
}
