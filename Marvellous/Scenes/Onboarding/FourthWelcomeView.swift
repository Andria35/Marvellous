//
//  FourthWelcomeView.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 28.02.24.
//

import SwiftUI

struct FourthWelcomeView: View {
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Color.black
            VStack {
                ZStack(alignment: .bottom) {
                    OnboardingImageComponentView(imageName: "FourthWelcomeView")
                    textVStack
                }
                
                OnboardingContinueButtonComponentView()
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}

// MARK: - UI Components
extension FourthWelcomeView {
    // MARK: - TextVStack
    private var textVStack: some View {
        VStack(alignment: .center) {
            Text("Plans according to your")
            Text("needs at affordable")
            Text("prices")
        }
        .font(.title3)
        .fontWeight(.bold)
        .foregroundStyle(.white)
    }
}

// MARK: - Preview
#Preview {
    FourthWelcomeView()
}
