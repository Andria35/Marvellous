//
//  SecondWelcomeView.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 28.02.24.
//

import SwiftUI

struct SecondWelcomeView: View {
    
    // MARK: - Properties
    var buttonTapped: () -> Void

    
    // MARK: - Body
    var body: some View {
        ZStack {
            Color.black
            VStack {
                ZStack(alignment: .bottom) {
                    OnboardingImageComponentView(imageName: "SecondWelcomeViewImage")
                    textVStack
                }
                ButtonComponentView(title: "Continue", action: buttonTapped, backgroundColor: .red)
                    .padding()
                    .padding(.bottom)
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}

// MARK: - UI Components
extension SecondWelcomeView {
    
    // MARK: - TextVStack
    private var textVStack: some View {
        VStack(alignment: .center) {
            Text("Watch online")
            Text("or")
            Text("Watch offline")
        }
        .font(.title3)
        .fontWeight(.bold)
        .foregroundStyle(.white)
    }
}

// MARK: - Preview
#Preview {
    SecondWelcomeView(buttonTapped: {})
}
