//
//  FifthWelcomeView.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 28.02.24.
//

import SwiftUI

struct FifthWelcomeView: View {
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Color.black
            VStack {
                ZStack(alignment: .bottom) {
                    OnboardingImageComponentView(imageName: "FifthWelcomeView")
                    getStartedText
                }
                
                OnboardingContinueButtonComponentView()
                Spacer()
            }
        }
        .ignoresSafeArea()
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
    FifthWelcomeView()
}
