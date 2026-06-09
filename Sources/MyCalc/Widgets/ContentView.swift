//
//  ContentView.swift
//  MyCalc
//
//  Created by Sri Harsha Chilakapati on 19/04/26.
//

import SwiftUI

struct ContentView: View {

    @StateObject var viewModel = CalculatorViewModel()

    var body: some View {
        ZStack {
            Color.gray
                .edgesIgnoringSafeArea(.all)
            
            let contents = mainContent()
            
            GeometryReader { proxy in
                if proxy.size.width <= proxy.size.height {
                    VStack {
                        contents
                    }
                } else {
                    HStack {
                        contents
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    func mainContent() -> some View {
        Group {
            EditorPane(displayText: viewModel.display)
                .padding(.top, 16)
                .padding(.horizontal, 16)

            CalcKeypadWidget(action: handleCalculatorAction(_:))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(16)
        }
    }

    private func handleCalculatorAction(_ buttonVariant: CalcButtonVariant) {
        switch buttonVariant {
            case .digit(let digit):
                viewModel.buttonTapped(digit: digit)
                break

            case .operation(let operation):
                viewModel.buttonTapped(operation: operation)
                break
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ContentView()
}
