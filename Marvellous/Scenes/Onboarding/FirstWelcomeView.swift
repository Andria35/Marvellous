//
//  FirstWelcomeView.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 28.02.24.
//

import SwiftUI

struct FirstWelcomeView: View {
    
    // MARK: - Properties
    var buttonTapped: () -> Void
    
    // MARK: - Body
    var body: some View {
        ZStack {
            MainBackgroundComponentView()
            VStack {
                ZStack(alignment: .bottom) {
                    OnboardingImageComponentView(imageName: "FirstWelcomeViewImage")
                    textVStack
                }
                ButtonComponentView(title: "Continue", action: buttonTapped, backgroundColor: .red, isDisabled: false)
                    .padding()
                    .padding(.bottom)
                Spacer()
            }
        }
    }
}

// MARK: - UI Components
extension FirstWelcomeView {
    
    // MARK: - TextVStack
    private var textVStack: some View {
        VStack(alignment: .center) {
            Text("All your favourite")
            Text("MARVEL Movies & Series")
            Text("at one place")
        }
        .font(.title3)
        .fontWeight(.bold)
        .foregroundStyle(.white)
    }
    
}

// MARK: - Preview
#Preview {
    FirstWelcomeView(buttonTapped: {})
}
