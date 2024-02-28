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
            Color.black
            VStack {
                ZStack(alignment: .bottom) {
                    OnboardingImageComponentView(imageName: "FirstWelcomeViewImage")
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