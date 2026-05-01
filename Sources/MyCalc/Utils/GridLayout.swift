//
//  GridLayout.swift
//  MyCalc
//
//  Created by Sri Harsha Chilakapati on 26/04/26.
//

import SwiftUI

struct GridLayout : Layout {
    
    typealias Cache = GridCache
    
    var columns: Int
    var spacing: CGFloat
    
    init(columns: Int, spacing: CGFloat = 12) {
        self.columns = columns
        self.spacing = spacing
    }
    
    func makeCache(subviews: Subviews) -> GridCache {
        GridCache()
    }
    
    func updateCache(_ cache: inout GridCache, subviews: Subviews) {
        // Layout is simple, do a full recompute instead of complex updating
        cache = makeCache(subviews: subviews)
    }
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout GridCache) -> CGSize {
        let availableWidth = proposal.width ?? 300
        
        if cache.lastWidth == availableWidth {
            return cache.totalSize
        }
        
        let spans = subviews.map { $0[GridItemKey.self] }

        var occupied: [[Bool]] = []
        var placements: [Int: (row: Int, col: Int, rowSpan: Int, colSpan: Int)] = [:]

        // Allocate the cells for each item based on spans
        for (index, span) in spans.enumerated() {
            var placed = false
            var row = 0

            while !placed {
                ensureRowCapacity(count: row + span.rowSpan, in: &occupied)

                for col in 0..<columns {
                    if canPlace(row, col, span, occupied) {
                        placements[index] = (row, col, span.rowSpan, span.colSpan)
                        markOccupied(row, col, span, &occupied)
                        placed = true
                        break
                    }
                }

                row += 1
            }
        }

        // Measurement phase
        var colWidths = Array(repeating: CGFloat(0), count: columns)
        var rowHeights = Array(repeating: CGFloat(0), count: occupied.count)
        
        let totalSpacing = spacing * CGFloat(columns - 1)
        let baseCellWidth = (availableWidth - totalSpacing) / CGFloat(columns)

        for (index, subview) in subviews.enumerated() {
            let placement = placements[index]!
            
            let possibleCellWidth = baseCellWidth * CGFloat(placement.colSpan)
                + spacing * CGFloat(placement.colSpan - 1)

            let measuredSize = subview.sizeThatFits(.init(width: possibleCellWidth, height: nil))
            
            let widthPerCol = measuredSize.width / CGFloat(placement.colSpan)
            let heightPerRow = measuredSize.height / CGFloat(placement.rowSpan)
            
            for col in placement.col..<(placement.col + placement.colSpan) {
                colWidths[col] = max(colWidths[col], widthPerCol)
            }
            
            for row in placement.row..<(placement.row + placement.rowSpan) {
                rowHeights[row] = max(rowHeights[row], heightPerRow)
            }
        }

        let totalWidth = colWidths.reduce(0, +) + spacing * CGFloat(colWidths.count - 1)
        let totalHeight = rowHeights.reduce(0, +) + spacing * CGFloat(rowHeights.count - 1)
        
        cache.lastWidth = availableWidth
        cache.colWidths = colWidths
        cache.rowHeights = rowHeights
        cache.placements = placements
        cache.totalSize = .init(width: totalWidth, height: totalHeight)
        
        return cache.totalSize
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout GridCache) {
        for (index, subview) in subviews.enumerated() {
            let placement = cache.placements[index]!
            
            let x = cache.colWidths[..<placement.col].reduce(0, +)
                + CGFloat(placement.col) * spacing
            
            let y = cache.rowHeights[..<placement.row].reduce(0, +)
                + CGFloat(placement.row) * spacing
            
            let width = cache.colWidths[placement.col..<placement.col+placement.colSpan].reduce(0, +)
                + CGFloat(placement.colSpan - 1) * spacing
            
            let height = cache.rowHeights[placement.row..<placement.row+placement.rowSpan].reduce(0, +)
                + CGFloat(placement.rowSpan - 1) * spacing
            
            subview.place(
                at: CGPoint(x: bounds.minX + x, y: bounds.minY + y),
                proposal: ProposedViewSize(width: width, height: height)
            )
        }
    }
    
    private func ensureRowCapacity(count rows: Int, in occupied: inout [[Bool]]) {
        while occupied.count < rows {
            occupied.append(Array(repeating: false, count: columns))
        }
    }
    
    private func canPlace(_ row: Int, _ col: Int, _ span: GridItemModel, _ occupied: [[Bool]]) -> Bool {
        guard row + span.rowSpan <= occupied.count,
              col + span.colSpan <= occupied[0].count else { return false }
        
        for r in row..<(row + span.rowSpan) {
            for c in col..<(col + span.colSpan) {
                if occupied[r][c] { return false }
            }
        }
        
        return true
    }
    
    private func markOccupied(_ row: Int, _ col: Int, _ span: GridItemModel, _ occupied: inout [[Bool]]) {
        for r in row..<(row + span.rowSpan) {
            for c in col..<(col + span.colSpan) {
                occupied[r][c] = true
            }
        }
    }
}

extension View {
    func gridSpan(rows: Int = 1, cols: Int = 1) -> some View {
        self.layoutValue(key: GridItemKey.self, value: GridItemModel(rowSpan: rows, colSpan: cols))
    }
}

struct GridItemKey : LayoutValueKey {
    nonisolated static let defaultValue: GridItemModel = .init(
        rowSpan: 1,
        colSpan: 1
    )
}

struct GridItemModel {
    let rowSpan: Int
    let colSpan: Int
}

typealias GridItemPlacement = (row: Int, col: Int, rowSpan: Int, colSpan: Int)

struct GridCache {
    var placements: [Int: GridItemPlacement] = [:]
    var rowHeights: [CGFloat] = []
    var colWidths: [CGFloat] = []
    var totalSize: CGSize = .zero
    var lastWidth: CGFloat? = nil
}
