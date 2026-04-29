//
//  GridLayout.swift
//  MyCalc
//
//  Created by Sri Harsha Chilakapati on 26/04/26.
//

import SwiftUI

struct GridLayout : Layout {
    
    var columns: Int
    var spacing: CGFloat
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        return CGSize.zero
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        
    }
    
}
