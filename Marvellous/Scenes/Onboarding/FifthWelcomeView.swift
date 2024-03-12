//
//  FifthWelcomeView.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 28.02.24.
//

import SwiftUI

struct FifthWelcomeView: View {
    
    // MARK: - Properties
    var buttonTapped: () -> Void
    
    // MARK: - Body
    var body: some View {
        ZStack {
            MainBackgroundComponentView()
            VStack {
                ZStack(alignment: .bottom) {
                    OnboardingImageComponentView(imageName: "FifthWelcomeViewImage")
                    getStartedText
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
extension FifthWelcomeView {
    // MARK: - TextVStack
    private var getStartedText: some View {
        Text("Lets Get Started!!!")
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(.white)
    }
}

// MARK: - Preview
#Preview {
    FifthWelcomeView(buttonTapped: {})
}
